class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.belongs_to :user

      t.timestamps
    end
  end
end
