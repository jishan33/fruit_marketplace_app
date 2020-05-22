class AddRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :product, null: false, foreign_key: true
  end
end
