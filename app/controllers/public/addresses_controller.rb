class Public::AddressesController < ApplicationController

  def index
    @customer = current_customer
    # ログインしているcustomerの情報のみ取得
    @addresses = @customer.addresses
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to action: :index
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to action: :index
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to action: :index
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
