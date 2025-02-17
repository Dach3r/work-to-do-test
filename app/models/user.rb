# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :projects
  has_many :tasks
  has_many :categories, as: :categorization
  has_many :project_users

  validates_presence_of :name, :last_name, :cellphone, :birthdate
end
