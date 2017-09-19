class AddIdToBudget < ActiveRecord::Migration[5.1]
  def change
    add_column :budgets, :id, :integer
  end
end
