class RemoveTypeFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :type, :integer
  end
end
