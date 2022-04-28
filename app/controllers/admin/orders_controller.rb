class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    #@cart_items = current_customer.cart_items

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
