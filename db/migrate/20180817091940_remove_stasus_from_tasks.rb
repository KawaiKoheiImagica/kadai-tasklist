class RemoveStasusFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :stasus, :string
  end
end
