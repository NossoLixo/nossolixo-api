class CreateJoinTablePlaceCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_places, id: false do |t|
      t.uuid :place_id, foreign_key: true, null: false
      t.uuid :category_id, foreign_key: true, null: false
    end
    add_index :categories_places, [:place_id, :category_id]
  end
end
