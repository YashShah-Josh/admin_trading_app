class CreateUserStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :user_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 0
      t.decimal :purchased_price, :float, default: 0.0
      t.decimal :current_price, :float, default: 0.0

      t.timestamps
    end
  end
end
