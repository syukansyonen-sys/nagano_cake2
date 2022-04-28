class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

  end

  private

  def order_params
    params.require(:order).permit(:making_status)
  end
end
