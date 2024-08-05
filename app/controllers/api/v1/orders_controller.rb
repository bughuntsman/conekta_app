module Api
  module V1
    class OrdersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        @order = OrderGenerator.new(orders_params).execute

        render json: @order
      end

      private

      def orders_params
        params.require(:order).permit(:currency,
          products: [:id, :quantity],
          customer_info: [:email, :name, :phone]
        )
      end
    end
  end
end