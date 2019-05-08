Rails.application.routes.draw do
  get 'products/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :root
  resources :user, only: :index
  resources :product
end
