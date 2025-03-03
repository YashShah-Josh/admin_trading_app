class AddOrderToTransactions < ActiveRecord::Migration[7.2]
  def change
		remove_reference :transactions, :stock, foreign_key: true
		add_reference :transactions, :order, foreign_key: true, index: true
  end
end
