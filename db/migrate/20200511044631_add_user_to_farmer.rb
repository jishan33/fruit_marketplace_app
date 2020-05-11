class AddUserToFarmer < ActiveRecord::Migration[6.0]
  def change
    add_reference :farmers, :user, null: false, foreign_key: true
  end
end
