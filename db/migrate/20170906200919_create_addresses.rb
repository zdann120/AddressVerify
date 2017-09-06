class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :name
      t.string :company
      t.string :phone
      t.jsonb :metadata
      t.string :description
      t.string :verification_code
      t.boolean :verified, default: false

      t.timestamps
    end
    add_index :addresses, :verification_code, unique: true
  end
end
