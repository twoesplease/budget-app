class LinkUserSlugToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_column :budgets, :user_slug, :string
    add_index :budgets, :user_slug
  end
end
