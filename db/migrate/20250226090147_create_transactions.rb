class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references "user", null: false, foreign_key: true
      t.references "stock", null: false, foreign_key: true
      t.string "transaction_type", null: false  # "buy" or "sell"
      t.decimal "price", precision: 15, scale: 2, null: false
      t.integer "quantity", null: false
      t.decimal "total_amount", precision: 15, scale: 2, null: false
      t.datetime "executed_at", null: false
      t.timestamps
    end
  end
end
