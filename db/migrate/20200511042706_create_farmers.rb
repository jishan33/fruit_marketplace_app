class CreateFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :farmers do |t|
      t.text :address
      t.text :fruit_types
      t.text :introduction

      t.timestamps
    end
  end
end
