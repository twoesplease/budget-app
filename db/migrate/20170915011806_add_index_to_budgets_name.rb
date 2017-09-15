class AddIndexToBudgetsName < ActiveRecord::Migration[5.1]
  def change
    add_index :budgets, :name, unique: true
  end
end
