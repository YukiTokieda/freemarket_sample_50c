Rails.application.routes.draw do
  devise_for :users

  root 'root#index'
  resources :root
  resources :products
  # マイページ
  get 'mypage', to: 'mypage/mypage#index'
  get 'logout', to: 'mypage/logout#index'
  namespace :mypage do
    resources :creditcard, only: [:index, :new, :create, :destroy]
    resources :identification, only: [:edit, :update]
  end
end
