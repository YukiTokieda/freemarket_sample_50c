Rails.application.routes.draw do
  devise_for :users
  resources :root
  resources :user, only: :index
  resources :product
  # マイページ
  get 'mypage', to: 'mypage/mypage#index'
  namespace :mypage do
    resources :creditcard, only: [:index, :new, :create, :destroy]
  end
end
