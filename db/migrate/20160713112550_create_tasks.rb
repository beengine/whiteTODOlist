class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.date :deadline
      t.integer :priority
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
