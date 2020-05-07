Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :gossips
  resources :cities, only: [:show]
  resources :likes, only: [:new, :create, :destroy]
end
