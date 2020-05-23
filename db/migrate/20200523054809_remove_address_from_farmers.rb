class RemoveAddressFromFarmers < ActiveRecord::Migration[6.0]
  def change
    remove_column :farmers, :address, :text
  end
end
