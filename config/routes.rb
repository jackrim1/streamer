Rails.application.routes.draw do
  root to: 'streams#index'
  resources :streams
  namespace :admin do
    resources :users
    root to: "streams#index"
  end
  
  devise_for :users
  resources :users
end
