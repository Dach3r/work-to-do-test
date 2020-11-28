# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :project_users
  has_many :users, through: :project_users

  validates_presence_of :name, :description, :due_date
end
