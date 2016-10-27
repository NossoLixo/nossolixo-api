class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places, id: :uuid do |t|
      t.uuid :city_id, index: true
      t.string :name, null: false
      t.string :description
      t.string :street, null: false
      t.string :number
      t.string :district
      t.string :lat, null: false
      t.string :lng, null: false
      t.string :phone_number
      t.string :email
      t.string :site
      t.uuid :requested_by_id, index: true, null: false
      t.uuid :approved_by_id, index: true
      t.datetime :approved_at

      t.timestamps
    end

    add_foreign_key :places, :cities
    add_foreign_key :places, :users, column: :requested_by_id
    add_foreign_key :places, :users, column: :approved_by_id
  end
end
