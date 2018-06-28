class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title_list
      t.integer :priority_list
      t.datetime :deadline_list
      t.belongs_to :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
