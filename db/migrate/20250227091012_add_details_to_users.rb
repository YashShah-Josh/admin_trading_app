class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :pan, :string
    add_column :users, :address, :text
    add_column :users, :balance, :decimal, precision: 15, scale: 2, default: 0.0

    # Add a unique index separately
    add_index :users, :pan, unique: true
  end
end
