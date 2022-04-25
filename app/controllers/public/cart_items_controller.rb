class Public::CartItemsController < ApplicationController
  
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
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def subtotal
    item.with_tax_price * amount
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)#保存カラムは未指定
  end
end
