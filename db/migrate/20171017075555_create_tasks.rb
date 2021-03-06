class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.date :due_date
      t.references :tasklist, foreign_key: true, index: true
      t.timestamps
    end
  end
end
