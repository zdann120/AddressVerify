class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def postcards
    data = JSON.parse request.body.read
    if @address = Address.find_by(postcard_id: data['body']['id'])
      @address.update(webhook_data: data)
      render json: { message: 'Webhook processed.' }, status: 200
    else
      render json: { message: 'Corresponding address not found.', status: 404 }
    end
  end
end
