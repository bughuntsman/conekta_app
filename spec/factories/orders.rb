# spec/factories/orders.rb
FactoryBot.define do
  factory :order do
    status { "pending" }
    amount { 100.0 }
    checkout_id { "#{SecureRandom.hex(10)}" }
    payment_link { "https://example.com/payment/#{SecureRandom.hex(10)}" }
  end
end
