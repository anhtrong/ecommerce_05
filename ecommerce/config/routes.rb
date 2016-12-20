Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users
  namespace admin do
    root "admin#index"
  end
end
