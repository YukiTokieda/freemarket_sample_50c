Rails.application.routes.draw do
  devise_for :users
  resources :root
  resources :user, only: :index
  resources :products
  resources :product
  # マイページ
  get 'mypage', to: 'mypage/mypage#index'
  get 'logout', to: 'mypage/logout#index'
  namespace :mypage do
    resources :creditcard, only: [:index, :new, :create, :destroy]
  end
  # 購入
  get 'transaction', to: 'transaction/buy#index'
  namespace :transaction do
    resources :buy
  end
end
