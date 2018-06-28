class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content_task
      t.integer :priority_task
      t.datetime :deadline_task
      t.belongs_to :list, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
