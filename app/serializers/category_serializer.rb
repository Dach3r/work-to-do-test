# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :categorization
end
