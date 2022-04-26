class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to '/orders/check'
  end

  def thanx
  end

  def index
    @orders = Order.all
  end

  def show
    @order = order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
