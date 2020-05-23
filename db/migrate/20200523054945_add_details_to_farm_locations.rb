class AddDetailsToFarmLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :farm_locations, :longitude, :float
    add_column :farm_locations, :latitude, :float
  end
end
