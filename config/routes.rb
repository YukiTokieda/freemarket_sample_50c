Rails.application.routes.draw do
  devise_for :users
  resources :root
<<<<<<< HEAD
  resources :users, only: :index
  resources :products, only: [:new]
=======
  resources :user, only: :index
  resources :products
  # マイページ
  get 'mypage', to: 'mypage/mypage#index'
  get 'logout', to: 'mypage/logout#index'
  namespace :mypage do
    resources :creditcard, only: [:index, :new, :create, :destroy]
  end
>>>>>>> master
end
