# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_presence_of :name, :description, :position
  validates :priority, inclusion: { in: %w[high medium low] }
  validates :status, inclusion: { in: %w[created pending published deleted] }

  scope :pending_board, -> { where(status: :pending) }
end
