class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :due_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
