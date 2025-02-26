class CreateStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :stocks do |t|
      t.string :symbol, null: false
      t.string :company_name, null: false
      t.decimal :current_price, precision: 15, scale: 2, default: 0.00
      t.decimal :price_change, precision: 15, scale: 2, default: 0.00
      t.boolean :is_active, default: true
      t.timestamps
    end

    # Add unique index for symbol
    add_index :stocks, :symbol, unique: true
  end
end
