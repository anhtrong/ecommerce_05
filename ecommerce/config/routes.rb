Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users
  resources :product_requests, only: [:new, :show, :create]
  resources :carts
  namespace :admin do
    root "users#index"
    resources :products
    resources :categories
  end
end
