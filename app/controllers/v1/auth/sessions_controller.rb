# frozen_string_literal: true

module V1
  module Auth
    class SessionsController < Devise::SessionsController
      include RenderHelper

      def create
        user = User.find_by_email(params[:user][:email])
        raise I18n.t('devise.failure.unauthenticated') unless user&.valid_password?(params[:user][:password])

        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        yield resource if block_given?
        render json: resource
      rescue StandardError => e
        default_error(e)
      end
    end
  end
end
