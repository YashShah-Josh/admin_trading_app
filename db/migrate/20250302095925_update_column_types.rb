class UpdateColumnTypes < ActiveRecord::Migration[7.2]
  def change
    change_column :orders, :price, :float, default: 0.0
		change_column :stocks, :current_price, :float, default: 0.0
		change_column :stocks, :price_change, :float, default: 0.0
		change_column :users, :balance, :float, default: 0.0
  end
end
