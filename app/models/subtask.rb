# frozen_string_literal: true

class Subtask < Task
  belongs_to :task, class_name: 'Task'

  def can_use_validation?
    false
  end
end
