class Public::CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to #リダイレクト先は未設定
  end
  
  def index
    @cart_items = CartItem.all
  end
  
  def update
  end
  
  def destroy
  end
  
  def reset
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:title, :body)#保存カラムは未指定
  end
end
