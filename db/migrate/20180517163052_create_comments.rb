class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :task
      t.string :content
      t.string :img_url

      t.timestamps
    end
  end
end
