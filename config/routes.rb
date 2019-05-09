Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :root, only: :index
  resources :user, only: :index
  resources :product
end
