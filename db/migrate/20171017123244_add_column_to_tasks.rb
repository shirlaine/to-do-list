class AddColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :status, :boolean, default: false, null: false
    add_column :tasks, :priority, :boolean, default: false, null: false
  end
end
