# frozen_string_literal: true

module Tasks
  class SubtaskSerializer < ApplicationSerializer
    attributes :name, :priority
  end
end
