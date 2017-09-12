class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :budget, foreign_key: true
      t.date :transaction_date
      t.decimal :transaction_amount

      t.timestamps
    end
  end
end
