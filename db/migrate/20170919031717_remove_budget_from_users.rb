class RemoveBudgetFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :budget
  end
end
