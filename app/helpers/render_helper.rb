# frozen_string_literal: true

module RenderHelper
  def default_success(data, status = 200)
    render json: {
      success: true,
      data: [data]
    }, status: status
  rescue StandardError => e
    raise e
  end

  def default_error(error, status = 200)
    render json: {
      success: true,
      data: [error]
    }, status: status
  rescue StandardError => e
    raise e
  end
end
