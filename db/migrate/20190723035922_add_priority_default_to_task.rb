class AddPriorityDefaultToTask < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :priority, :integer, default: 2 
  end
end
