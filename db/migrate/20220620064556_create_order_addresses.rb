class CreateOrderAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_addresses do |t|
      t.string :post_code,null: false
      t.integer :pref_id,null: false
      t.string :city,null: false
      t.string :address_line1,null: false
      t.string :address_line2
      t.string :number,null: false
      t.references :order,null: false,foreign_key: true
      t.timestamps
    end
  end
end
