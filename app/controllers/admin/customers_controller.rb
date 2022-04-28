class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "会員情報の変更が完了しました。"
      # 会員詳細ページへリダイレクト
        redirect_to action: :show
    else
      flash[:alert] = "会員情報の変更内容に不備があります。"
      @customer = Customer.find(params[:id])
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_status)
  end
end
