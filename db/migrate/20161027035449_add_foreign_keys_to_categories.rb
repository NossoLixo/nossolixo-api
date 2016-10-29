class AddForeignKeysToCategories < ActiveRecord::Migration[5.0]
  def change
    add_index :categories, :requested_by_id
    add_index :categories, :approved_by_id
    add_foreign_key :categories, :users, column: :requested_by_id
    add_foreign_key :categories, :users, column: :approved_by_id
  end
end
