class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.string :transaction_type
      t.decimal :price
      t.integer :quantity
      t.decimal :total_amount
      t.datetime :executed_at

      t.timestamps
    end
  end
end
