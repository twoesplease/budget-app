class AddForeignKeyToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :transactions, :budgets
  end
end
