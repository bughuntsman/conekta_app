require 'rails_helper'

RSpec.describe "Webhooks", type: :request do
  let(:webhook_params) do
    {data:
      {object:
        {
          livemode: false,
          amount: 30000,
          currency: "MXN",
          payment_status: "paid",
          amount_refunded: 0,
          customer_info:
            { email: "email2@example.com",
              phone: "6215555555555",
              name: "Customer name",
              corporate: false,
              customer_id: "cus_2wPg8yYGSum2YLQA5",
              object: "customer_info"
            },
          channel:
            {
              segment: "Checkout",
              checkout_request_id: "f96384c9-5d5e-400a-8621-a2bf598d30d5",
              checkout_request_type: "PaymentLink",
              id: "channel_2wPg8yuFvypoxSQby"
            }
        }
      }
    }
  end

  describe "POST /conekta" do
    it "returns http success" do
      post "/webhook/conekta", params: webhook_params.to_json

      expect(response).to have_http_status(:success)
    end
  end
end
