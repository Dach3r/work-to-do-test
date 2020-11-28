# frozen_string_literal: true

class ProjectSerializer < ApplicationSerializer
  attributes :id, :name, :due_date, :description
  belongs_to :user
  has_many :tasks
  has_many :users
end
