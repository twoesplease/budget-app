class AddUserSlugIndexToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :budgets, :users, column: :user_slug
  end
end
