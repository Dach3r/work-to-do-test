# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :subtasks, class_name: 'Subtask', foreign_key: 'task_id'

  has_many :categories, as: :categorization

  validates_presence_of :name, :position
  validates :description, presence: true, if: :can_use_validation?
  validates :priority, inclusion: { in: ConstantHelper::PRIORITY_LIST }
  validates :status, inclusion: { in: ConstantHelper::STATUS_LIST }

  scope :pending_board, -> { where(status: :pending) }

  def can_use_validation?
    true
  end
end
