class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def check
  end
  
  def create
    order = Order.new(order_params)
    order.save
    redirect_to #リダイレクト先は未設定
  end
  
  def thanx
  end
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:title, :body)#保存カラムは未指定
  end
end
