class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :budget
      t.string :password_digest
      t.string :string

      t.timestamps
    end
  end
end
