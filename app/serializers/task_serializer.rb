# frozen_string_literal: true

class TaskSerializer < ApplicationSerializer
  attributes :id, :name, :description, :position, :priority, :status

  belongs_to :project
  belongs_to :user
  has_many :subtasks, serializer: Tasks::SubtaskSerializer
end
