class RemoveColorFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :color
  end
end
