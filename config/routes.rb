Rails.application.routes.draw do
  root to: "homes#top"
  get '/home/about' => 'homes#about', as: "about"

  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
#管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
scope module: :public do
  resources :items, only: [:index, :show]
  delete '/cart_items/reset' => '/public/cart_items#reset'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  patch '/customers/quit' => '/public/customers#quit'
  resources :customers, only: [:edit, :update]
  get '/customers/my_page' => '/public/customers#show'
  get '/customers/out' => '/public/customers#out'
  resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  resources :orders, only: [:new, :create, :index, :show]
  post '/orders/check' => '/public/orders#check'
  get '/orders/thanx' => '/public/orders#thanx'
end

# 管理者用
namespace :admin do
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show, :update] do
    resources :order_details, only: [:update]
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end