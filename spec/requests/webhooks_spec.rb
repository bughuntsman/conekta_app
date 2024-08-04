require 'rails_helper'

RSpec.describe "Webhooks", type: :request do
  describe "GET /conekta" do
    it "returns http success" do
      get "/webhooks/conekta"
      expect(response).to have_http_status(:success)
    end
  end

end
