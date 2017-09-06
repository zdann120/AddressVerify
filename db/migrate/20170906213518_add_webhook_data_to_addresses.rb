class AddWebhookDataToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :webhook_data, :jsonb
  end
end
