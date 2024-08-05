require 'rails_helper'

RSpec.describe OrderGenerator do
  context 'when params are valid' do
    let(:product) { create(:product, price: 10000) }
    let(:orders_params) do
      {
        products: [{id: product.id, quantity: 2}],
        customer_info: {
          email: "email@example.com",
          name: "Customer name",
          phone: "5215555555555"
        }
      }
    end

    it 'should create a new record' do
      expect {
        described_class.new(orders_params).execute
      }.to change { Order.count }.by(1)
    end
  end
end