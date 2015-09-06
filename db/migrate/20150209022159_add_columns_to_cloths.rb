class AddColumnsToCloths < ActiveRecord::Migration
  def change
  	  add_column :cloths, :category, :string
  	  add_column :cloths, :available_size, :string
  	  add_column :cloths, :available_color, :string
  	  add_column :cloths, :brand, :string
  end
end
