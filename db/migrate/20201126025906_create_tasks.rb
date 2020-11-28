class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :priority, null: false
      t.string :status, default: :created
      t.text :description
      t.integer :position, default: 999
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
