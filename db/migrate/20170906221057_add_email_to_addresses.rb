class AddEmailToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :email, :string
    add_index :addresses, :email, unique: true
  end
end
