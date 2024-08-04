module Api
  module V1
    class OrdersController < ApplicationController
      def create
        OrderGenerator.new(orders_params).execute
      end

      private 

      def orders_params
        params.require(:order).permit(
          products: [:id, :quantity], 
          customer_info: [:email, :name, :phone]
        )
      end
    end
  end
end