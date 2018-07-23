Rails.application.routes.draw do
  root to: 'streams#index'
  
  resources :streams do 
    resource :reddit
    member do
      put "like", to: "streams#upvote"
      put "dislike", to: "streams#downvote"
    end
  end
  

  

  

  resources :search do
  end

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

mount Commontator::Engine => '/commontator'

end
