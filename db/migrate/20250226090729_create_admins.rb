class CreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, default: "admin" 
      t.timestamps
    end

    # Add unique index for email
    add_index :admins, :email, unique: true
  end
end
