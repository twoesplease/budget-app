class AddTransactionTotalToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :transaction_total, :integer
  end
end
