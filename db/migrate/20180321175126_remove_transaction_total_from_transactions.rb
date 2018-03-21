class RemoveTransactionTotalFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :transaction_total
  end
end
