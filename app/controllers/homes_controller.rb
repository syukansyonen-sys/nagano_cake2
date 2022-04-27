class HomesController < ApplicationController


  def top
    # 商品をidの逆順で並べ替えて、4件取得
    @items = Item.order(id: :DESC).limit(4)

  end

  def about
  end
end
