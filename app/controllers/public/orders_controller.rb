class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def check
    @order = Order.new
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.ship_cost #800円
    if params[:order][:address_option] == "1"

      @order.payment_method = (params[:order][:payment_method])
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "2"
      @order.payment_method = (params[:order][:payment_method])
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:address_option] == "3"

      @order.payment_method = (params[:order][:payment_method])
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
    order.status = 0
    @cart_items = current_customer.cart_items.all
    if order.save
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = order.id
        order_detail.item_id = cart_item.item.id
        order_detail.price = cart_item.item.with_tax_price
        order_detail.amount = cart_item.amount
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to '/orders/thanx'
    end

  end

  def thanx
  end

  def index
    @orders = current_customer.orders


  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items.all

  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment)
  end
end
