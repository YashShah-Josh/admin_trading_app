class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :password_digest, null: false
      t.timestamps
    end

    # Add unique constraints correctly
    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end
