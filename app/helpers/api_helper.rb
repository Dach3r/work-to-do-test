# frozen_string_literal: true

module ApiHelper
  include RenderHelper

  def user_session
    @user = nil
    @user = current_user if @user.nil? && user_signed_in?
  rescue StandardError => e
    default_error(e)
  end
end
