class AddRequestedByAndApprovedByToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :requested_by_id, :uuid, null: false
    add_column :categories, :approved_by_id, :uuid
  end
end
