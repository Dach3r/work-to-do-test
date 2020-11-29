# frozen_string_literal: true

class ProjectSerializer < ApplicationSerializer
  attributes :id, :name, :due_date, :description
  belongs_to :user, key: 'owner'
  has_many :users, key: 'team'
  has_many :tasks
end
