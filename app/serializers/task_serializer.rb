# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :position, :status

  belongs_to :project
  belongs_to :user
end
