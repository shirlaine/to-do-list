class CreateTasklists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklists do |t|
      t.string :title, null: false
      t.timestamps
    end
  end
end
