class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:address] == "2"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:address] == "3"
      address = Address.new
      address.customer_id = current_customer.id
      address.postal_code = params[:order][:postal_code]
      address.address = params[:order][:address]
      address.name = params[:order][:name]
      address.save

      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :address_id)
  end
end
