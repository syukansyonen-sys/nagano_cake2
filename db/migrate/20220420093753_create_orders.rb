class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
     t.integer :customer_id, null: false
     t.integer :shipping_cost, default: 800, null: false
     t.integer :total_payment, default: 0, null: false
     t.integer :payment_method, default: 0, null: false
     t.integer :status, null: false
     t.string :name, null: false
     t.string :address, null: false
     t.string :postal_code, null: false
     t.timestamps
    end
  end
end
