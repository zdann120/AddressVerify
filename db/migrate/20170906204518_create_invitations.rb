class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :access_code
      t.integer :used_by
      t.boolean :used, default: false

      t.timestamps
    end
    add_index :invitations, :access_code, unique: true
    add_index :invitations, :used_by, unique: true
  end
end
