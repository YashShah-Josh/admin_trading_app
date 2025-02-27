class FixDatabaseSchema < ActiveRecord::Migration[7.2]
  def change
    # Fix Admins Table
    add_column :admins, :name, :string, null: false, default: "Admin"
    add_index :admins, :confirmation_token, unique: true

    # Fix Stocks Table
    change_column :stocks, :current_price, :decimal, precision: 15, scale: 2, default: 0.0
    change_column :stocks, :price_change, :decimal, precision: 15, scale: 2, default: 0.0
    change_column :stocks, :is_active, :boolean, default: true

    # Fix Orders Table
    change_column :orders, :price, :decimal, precision: 15, scale: 2
    change_column :orders, :order_type, :string, null: false, default: "buy"
    change_column :orders, :status, :string, default: "pending"

    # Fix Transactions Table
    change_column :transactions, :price, :decimal, precision: 15, scale: 2
    change_column :transactions, :total_amount, :decimal, precision: 15, scale: 2
    change_column :transactions, :transaction_type, :string, null: false, default: "buy"

    # Fix Users Table
    add_column :users, :password_digest, :string, null: false, default: ""
  end
end
