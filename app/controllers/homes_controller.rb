class HomesController < ApplicationController
  

  def top
    # s商品をidの順番で並べ
    @items = Item.order(:id)
    
  end
  
  def about
  end
end
