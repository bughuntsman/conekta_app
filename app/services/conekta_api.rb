class ConektaApi
  class << self
    def generate_payment_link(products, expires_at = nil, currency = 'MXN', customer_info = {})
      api_instance = Conekta::PaymentLinkApi.new
      checkout = Conekta::Checkout.new(
        { 
          allowed_payment_methods: ["cash", "card", "bank_transfer"], 
          expires_at: expires_at || default_expiration, 
          name: "Payment Link Name #{default_expiration}",
          needs_shipping_contact: false,
          order_template: Conekta::CheckoutOrderTemplate.new(
            {
              currency: currency, 
              line_items: [Conekta::Product.new({name: 'Box of Cohiba S1s', quantity: 1, unit_price: 20000})],
              customer_info: {
                email: "isaiasdelahoz@gmail.com",
                name: "miguel perez",
                phone: "5215555555555"
              }
            }
          ),
          recurrent: false,
          type: 'PaymentLink'
        }
      ) # Checkout | requested field for checkout

      opts = {
        #accept_language: 'es', # String | Use for knowing which language to use
        #x_child_company_id: '6441b6376b60c3a638da80af' # String | In the case of a holding company, the company id of the child company to which will process the request.
      }

      begin
        # Create Unique Payment Link
        result = api_instance.create_checkout(checkout, opts)
        p result
      rescue Conekta::ApiError => e
        puts "Error when calling PaymentLinkApi->create_checkout: #{e}"
      end
    end

    private def conekta_product(products)
      products.map do |product|
        Conekta::Product.new(product)
      end
    end

    private def default_expiration
      (Time.now + 1.day).to_i
    end
  end
end