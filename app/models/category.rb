# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :categorization, polymorphic: true

  validates :name, presence: true

  scope :apply_filter, ->(type) { where(categorization_type: type.capitalize) }
end
