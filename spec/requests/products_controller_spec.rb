require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :request do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }
  let(:headers) { { "Content-Type" => "application/json" } }

  describe "GET /api/v1/products" do
    before { get "/api/v1/products" }

    it "returns products" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/products/:id" do
    before { get "/api/v1/products/#{product_id}" }

    context "when the record exists" do
      it "returns the product" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:product_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end

  describe "POST /api/v1/products" do
    let(:valid_attributes) { { name: 'Product 1', description: 'Description 1', price: 10.0 }.to_json }

    context "when the request is valid" do
      before { post "/api/v1/products", params: valid_attributes, headers: headers }

      it "creates a product" do
        expect(json['name']).to eq('Product 1')
        expect(json['price']).to eq(10.0)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { name: nil, price: 100 }.to_json }
      before { post "/api/v1/products", params: invalid_attributes, headers: headers }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /api/v1/products/:id" do
    let(:valid_attributes) { { name: 'Updated Product' }.to_json }

    context "when the record exists" do
      before { put "/api/v1/products/#{product_id}", params: valid_attributes, headers: headers }

      it "updates the record" do
        expect(json['name']).to eq('Updated Product')
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:product_id) { 100 }
      before { put "/api/v1/products/#{product_id}", params: valid_attributes, headers: headers }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end

  describe "DELETE /api/v1/products/:id" do
    before { delete "/api/v1/products/#{product_id}", headers: headers }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  def json
    JSON.parse(response.body)
  end
end
