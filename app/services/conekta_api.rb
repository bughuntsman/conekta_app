class ConektaApi
  class << self
    def generate_payment_link(products, customer_info = {}, currency = 'MXN', expires_at = nil)
      checkout = Conekta::Checkout.new(
        { 
          allowed_payment_methods: ["cash", "card", "bank_transfer"], 
          expires_at: expires_at || default_expiration, 
          name: "Payment Link Name #{default_expiration}",
          needs_shipping_contact: false,
          order_template: Conekta::CheckoutOrderTemplate.new(
            {
              currency: currency,
              line_items: conekta_product(products),
              customer_info: customer_info
            }
          ),
          recurrent: false,
          type: 'PaymentLink'
        }
      )

      api_instance.create_checkout(checkout, {})
    end

    private

    def api_instance
      Conekta::PaymentLinkApi.new
    end

    def conekta_product(products)
      products.map do |product|
        Conekta::Product.new(product)
      end
    end

    def default_expiration
      (Time.now + 1.day).to_i
    end
  end
end