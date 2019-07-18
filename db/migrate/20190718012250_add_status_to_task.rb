class AddStatusToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string
    change_column_null :tasks, :status, false
  end
end
