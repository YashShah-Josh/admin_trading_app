class UpdateSchemaForUsers < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :name, :string, null: true
    change_column :users, :email, :string, null: true
    change_column :users, :phone, :string, null: true
    change_column :users, :password_digest, :string, null: true
    change_column :users, :pan, :string, null: true
    change_column :users, :address, :text, null: true
    change_column :users, :balance, :decimal, precision: 15, scale: 2, default: nil, null: true

    # Ensure foreign keys only (No other constraints)
    add_foreign_key :orders, :users
    add_foreign_key :orders, :stocks
    add_foreign_key :transactions, :users
    add_foreign_key :transactions, :stocks

    # Keep unique indexes for integrity
    # add_index :users, :email, unique: true
    # add_index :users, :pan, unique: true
  end
end
