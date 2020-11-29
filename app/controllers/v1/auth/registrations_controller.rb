# frozen_string_literal: true

module V1
  module Auth
    class RegistrationsController < Devise::RegistrationsController
      include RenderHelper

      def create
        build_resource(sign_up_params)

        resource.save!
        yield resource if block_given?
        if resource&.active_for_authentication?
          sign_up(resource_name, resource)
          render json: resource
        end
      rescue StandardError => e
        default_error(e)
      end
    end
  end
end
