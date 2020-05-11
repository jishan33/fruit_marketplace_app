class AddRefToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :farmer, null: false, foreign_key: true
  end
end
