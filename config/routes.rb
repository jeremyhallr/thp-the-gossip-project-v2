Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :cities, only: [:show]
  resources :gossips do
    resources :likes
  end
end