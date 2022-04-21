class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end
  
  def create
    address = Address.new(address_params)
    address.save
    redirect_to #リダイレクト先は未設定
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to #リダイレクト先は未設定
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to #リダイレクト先は未設定
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :address, :post_code)
  end
end
