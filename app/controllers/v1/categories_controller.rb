# frozen_string_literal: true

module V1
  class CategoriesController < ApplicationController
    def index
      categories = Category.apply_filter(params[:type])
      render json: categories
    rescue StandardError => e
      default_error(e)
    end

    def create
      category = Category.create!(category_params)
      render json: category
    rescue StandardError => e
      default_error(e)
    end

    private

    def category_params
      params.permit(:name, :categorization_type, :categorization_id)
    end
  end
end
