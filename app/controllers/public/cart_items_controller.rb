class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @new_cart_item = CartItem.find_by(item: @cart_item.item)
    if @new_cart_item.present?
      @cart_item.amount += @new_cart_item.amount
      @new_cart_item.destroy
    end
    
    if @cart_item.save
    redirect_to cart_items_path
    else
    render ('item/show')
    end
  end

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def reset
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :image)
  end
end
