class WebhooksController < ApplicationController
  def conekta
    payload = request.raw_post

    event = JSON.parse(payload)
    Rails.logger.info "Evento recibido: #{event}"

    render json: { message: 'Webhook received' }, status: 200
  end
end
