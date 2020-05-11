class AddNameToFarmers < ActiveRecord::Migration[6.0]
  def change
    add_column :farmers, :name, :string
  end
end
