# frozen_string_literal: true

module V1
  module Auth
    class PasswordsController < Devise::PasswordsController
      include RenderHelper

      def create
        user = User.find_by_email(params[:user][:email])
        raise I18n.t('devise.failure.not_found_in_database') if user.blank?

        default_success(I18n.t('devise.passwords.send_instructions')) if user.send_reset_password_instructions
      rescue StandardError => e
        default_error(e)
      end

      def update
        raise I18n.t('errors.messages.token_not_valid') unless params[:user][:reset_password_token].present?
        raise I18n.t('devise.passwords.send_paranoid_instructions') unless Devise.sign_in_after_reset_password

        self.resource = resource_class.reset_password_by_token(resource_params)
        yield resource if block_given?
        resource.unlock_access! if unlockable?(resource)
        resource.after_database_authentication
        default_success(I18n.t('devise.passwords.updated_not_active'))
      rescue StandardError => e
        default_error(e)
      end
    end
  end
end
