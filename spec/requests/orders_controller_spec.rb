require 'rails_helper'

RSpec.describe "OrdersController", type: :request do
  let!(:product) { create(:product) }

  let(:order_params) do
    {
      order: {
        currency: "MXN",
        products: [{id: product.id, quantity: 1}],
        customer_info: {
          email: "email@example.com", 
          name: "Joe", 
          phone: "5034323445"
        }
      }
    }
  end


  describe "POST /conekta" do
    it "returns http success" do
      post "/api/v1/orders", params: order_params

      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      expect {
        post "/api/v1/orders", params: order_params
      }.to change { Order.count }.by(1)
    end
  end
end
