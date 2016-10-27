class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :name, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
