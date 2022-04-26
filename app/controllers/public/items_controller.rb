class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def with_tax_price
    (price * 1.1).floor
  end

  private
  def items_params
    parmas.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
