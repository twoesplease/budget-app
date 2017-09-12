class AddNoteToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :note, :text
  end
end
