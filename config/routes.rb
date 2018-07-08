Rails.application.routes.draw do
  root to: 'streams#index'
  resources :streams
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  
  devise_for :users, :controllers => { registrations: 'registrations'}
  
  resources :users do
  	member do
  		get :following, :followers
  	end
  end

resources :relationships, only: [:create, :destroy]

end
