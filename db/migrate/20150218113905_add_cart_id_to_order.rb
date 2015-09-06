class AddCartIdToOrder < ActiveRecord::Migration
  def change
  	 add_column :orders, :cart_id, :integer
  	 add_column :orders, :status, :string
  end
end
