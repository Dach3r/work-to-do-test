class AddSubtaskIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :task_id, :integer, index: true
  end
end
