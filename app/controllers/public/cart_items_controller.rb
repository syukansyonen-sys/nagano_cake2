class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer_id
    cart_item.save
    redirect_to #リダイレクト先は未設定
  end
  
  def index
    @cart_items = CartItem.all
  end
  
  def update
    @cart_item = CartItem.find(params["id"])
  end
  
  def destroy
  end
  
  def reset
  end
  def subtotal
    item.with_tax_price * amount
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)#保存カラムは未指定
  end
end
