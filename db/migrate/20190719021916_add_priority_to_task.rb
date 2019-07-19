class AddPriorityToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :integer
    change_column_null :tasks, :priority, false
  end
end
