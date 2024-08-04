require 'rails_helper'

RSpec.describe ConektaApi, type: :model do
  let(:products) do
    [
      {name: 'Product 1', quantity: 1, unit_price: 10000},
      {name: 'Product 2', quantity: 2, unit_price: 30000},
      {name: 'Product 3', quantity: 1, unit_price: 24000},
    ]
  end

  context 'when params are valid' do
    let(:customer) do
      {
        email: "email@example.com",
        name: "Customer name",
        phone: "5215555555555"
      }
    end

    it 'should generate a valid payment link' do
      response = described_class.generate_payment_link(products, customer_info = customer)

      expect(response.status).to eq("Issued")
      expect(response.url).not_to be_empty
      expect(response.id).not_to be_empty
    end
  end

  context 'when params are invalid' do
    it 'should raise an error' do
      expect {
        described_class.generate_payment_link(products, customer_info = {})
      }.to raise_error(Conekta::ApiError)
    end
  end
end
