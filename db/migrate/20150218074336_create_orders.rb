class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :nrc
      t.string :contact_phone
      t.string :shipping_address

      t.timestamps
    end
  end
end
