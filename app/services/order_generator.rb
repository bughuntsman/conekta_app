class OrderGenerator
  attr :orders_params

  def initialize(orders_params)
    @orders_params = orders_params
  end

  def execute
    Order.create(
      status: "pending",
      amount: amount,
      charge_id: payment_link.slug, 
      payment_link: payment_link.url
    )
  end

  private

  def amount
    products.sum { |product| product[:unit_price] * product[:quantity] }
  end

  def payment_link
    @link ||= ConektaApi.generate_payment_link(products, customer_info = customer_atrr)
  end

  def products
    orders_params[:products].map do |product|
      item = Product.find(product[:id])

      {name: item.name, quantity: product[:quantity], unit_price: item.price}
    end
  end

  def customer_atrr
    orders_params[:customer_info]
  end
end