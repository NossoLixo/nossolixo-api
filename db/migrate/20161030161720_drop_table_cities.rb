class DropTableCities < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :city_id
    drop_table :cities
  end
end
