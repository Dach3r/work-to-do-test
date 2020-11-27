# frozen_string_literal: true

class CategorySerializer < ApplicationSerializer
  attributes :id, :name

  belongs_to :categorization
end
