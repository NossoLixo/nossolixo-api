class AddCityAndStateToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :city, :string, null: false
    add_column :places, :state, :string, null: false
  end
end
