class RemoveBudgetIdFromTransactionsDupe < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :budget_id
  end
end
