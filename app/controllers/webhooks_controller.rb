class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def conekta
    payload = request.raw_post
    @event = JSON.parse(payload)
    order = Order.find_by!(checkout_id: checkout_id)
    order.update(status: payment_status, amount: amount)
    Rails.logger.info "Evento recibido: #{@event}"

    render json: { message: 'Webhook received' }, status: 200
  end

  private
  def checkout_id
    @event["data"]["object"]["channel"]["checkout_request_id"]
  end

  def payment_status
    @event["data"]["object"]["payment_status"]
  end

  def amount
    @event["data"]["object"]["amount"]
  end
end
