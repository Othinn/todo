class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.boolean :task_status, default: false
      t.belongs_to :project
      t.integer :priority
      t.datetime :deadline

      t.timestamps
    end
  end
end
