class RemoveAttributeFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :products, null: false, foreign_key: true
  end
end
