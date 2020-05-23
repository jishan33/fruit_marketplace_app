class RemoveNameFromFarmLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :farm_locations, :name, :string
  end
end
