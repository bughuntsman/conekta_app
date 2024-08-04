class OrderGenerator
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

  def amount
    products.each do |product|
      amount += product[:unit_price] * product[:quantity]
    end
    amount
  end

  def payment_link
    @link ||= ConektaApi.generate_payment_link(products, customer_info = customer_info)
  end

  def products
    orders_params[:products].map do |product|
      item = Product.find(product[:id])

      {name: item.name, quantity: product[:quantity], unit_price: item.price}
    end
  end

  def customer_info
    orders_params[:customer_info]
  end
end