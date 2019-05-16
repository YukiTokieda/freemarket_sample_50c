Rails.application.routes.draw do
  # 認証
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # トップページ
  root 'root#index'

  # 商品
  resources :products
  
  # マイページ
  get 'mypage', to: 'mypage/mypage#index'
  get 'logout', to: 'mypage/logout#index'
  namespace :mypage do
    resources :creditcard, only: [:index, :new, :create, :destroy]
    resources :identification, only: [:edit, :update]
    resources :profiles, only: [:edit, :update]
  end
  
  # 購入
  get 'transaction', to: 'transaction/buy#index'
  namespace :transaction do
    resources :buy
  end
end
