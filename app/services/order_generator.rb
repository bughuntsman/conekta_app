class OrderGenerator
  attr :orders_params

  def initialize(orders_params)
    @orders_params = orders_params
  end

  def execute
    @order = Order.create(
      status: "pending",
      amount: amount,
      currency: order_currency,
      checkout_id: payment_link.id,
      payment_link: payment_link.url
    )

    assing_products_to_order
  end

  private

  def assing_products_to_order
    return @order if @order.update!(product_ids: orders_params[:products].pluck(:id))
  end

  def amount
    products.sum { |product| product[:unit_price] * product[:quantity] }
  end

  def payment_link
    @link ||= ConektaApi.generate_payment_link(
      products, customer_info = customer_atrr, currency = order_currency
    )
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

  def order_currency
    orders_params[:currency] || 'MXN'
  end
end