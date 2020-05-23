class AddRefToFarmLocations < ActiveRecord::Migration[6.0]
  def change
    add_reference :farm_locations, :farmer, null: false, foreign_key: true
  end
end
