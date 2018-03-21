class RemoveBudgetIndexFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_index(:transactions, :name => 'index_transactions_on_budget_id')
  end
end
