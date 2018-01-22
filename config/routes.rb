Rails.application.routes.draw do
  resources :seats
  devise_for :users
  resources :cities
  resources :stops
  resources :sits do  
    member do
      patch :activate
    end
  end
  resources :buses 
  resources :transporters
  resources :journeys
  resources :tos
  resources :froms
  resources :searches
  resources :charges
  resources :purchases, only: [:show]


  root 'journeys#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
