# frozen_string_literal: true

class ProjectSerializer < ApplicationSerializer
  attributes :id, :name, :due_date, :description
end
