# frozen_string_literal: true

module Tasks
  class SubtaskSerializer < ApplicationSerializer
    attributes :id, :name, :priority
  end
end
