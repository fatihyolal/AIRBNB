Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :listings, only: %i[new show edit destroy create]
  resources :bookings, only: %i[post new update edit] do
    resources :reviews, only: %i[create new]
  end
end
