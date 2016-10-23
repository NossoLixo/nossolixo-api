class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.boolean :approved, null: false
      t.datetime :approved_at

      t.timestamps
    end
  end
end
