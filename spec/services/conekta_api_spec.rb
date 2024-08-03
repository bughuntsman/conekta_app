require 'rails_helper'

RSpec.describe ConektaApi, type: :model do
  context '' do
    let(:products) do
      [
        {name: 'Product 1', quantity: 1, unit_price: 10000},
        {name: 'Product 2', quantity: 2, unit_price: 30000},
        {name: 'Product 3', quantity: 1, unit_price: 24000},
      ]
    end

    let(:customer) do
      {
        email: "email@example.com",
        name: "Customer name",
        phone: "5215555555555"
      }
    end

    it '' do
      response = described_class.generate_payment_link(products, customer_info = customer)
    end
  end
end
