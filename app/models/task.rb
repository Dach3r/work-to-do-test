# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :categories, as: :categorization

  validates_presence_of :name, :description, :position
  validates :priority, inclusion: { in: ConstantHelper::PRIORITY_LIST }
  validates :status, inclusion: { in: ConstantHelper::STATUS_LIST }

  scope :pending_board, -> { where(status: :pending) }
end
