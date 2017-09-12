class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.references :user, foreign_key: true
      t.decimal :goal_total
      t.date :goal_date

      t.timestamps
    end
  end
end
