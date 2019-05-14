Rails.application.routes.draw do
  devise_for :users

  root 'root#index'
  resources :products
  # マイページ
  get 'mypage', to: 'mypage/mypage#index'
  get 'logout', to: 'mypage/logout#index'
  namespace :mypage do
    resources :creditcard, only: [:index, :new, :create, :destroy]
    resources :identification, only: [:edit, :update]
  end
  # 購入
  get 'transaction', to: 'transaction/buy#index'
  namespace :transaction do
    resources :buy
  end
end
