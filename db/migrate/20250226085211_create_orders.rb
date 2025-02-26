class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references "user", null: false, foreign_key: true
      t.references "stock", null: false, foreign_key: true
      t.string "order_type", null: false  # "buy" or "sell"
      t.decimal "price", precision: 15, scale: 2, null: false
      t.integer "quantity", null: false
      t.string "status", default: "pending"  # ["pending", "completed", "canceled"]
      t.timestamps
    end
  end
end
