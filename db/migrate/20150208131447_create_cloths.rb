class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.integer :price
      t.string :item_code
      t.string :item_name

      t.timestamps
    end
  end
end
