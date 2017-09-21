class DropBudgets < ActiveRecord::Migration[5.1]
  def change
    drop_table :budgets
  end
end
