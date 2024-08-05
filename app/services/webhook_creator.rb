class WebhookCreator
  class << self
    def create
      webhook_request = Conekta::WebhookRequest.new(
        { 
          url: 'https://17c0-181-58-39-24.ngrok-free.app/webhook/conekta', 
          synchronous: false
        }
      )
      opts = {
        accept_language: 'es'
      }
  
      api_instance.create_webhook(webhook_request, opts)
    end

    def api_instance
      Conekta::WebhooksApi.new
    end
  end
end