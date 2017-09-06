class AddPostcardToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :postcard_id, :string
    add_index :addresses, :postcard_id, unique: true
  end
end
