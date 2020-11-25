# frozen_string_literal: true

module V1
  module Auth
    class RegistrationsController < Devise::RegistrationsController
      include RenderHelper

      def create
        build_resource(sign_up_params)
        resource.save!
        sign_in(resource_name, resource)
        render json: resource
      rescue StandardError => e
        default_error(e)
      end
    end
  end
end
