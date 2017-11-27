class AddRemainingAmountToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_column :budgets, :remaining_amount, :integer
  end
end
