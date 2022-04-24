class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @item = Item.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
