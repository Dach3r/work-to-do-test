# frozen_string_literal: true

module Tasks
  class TaskPublicSerializer < ApplicationSerializer
    attributes :id, :name, :priority
  end
end
