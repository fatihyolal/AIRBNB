Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/listings/:id/edit", to: "listings#edit", as: :listing_edit
  patch "listings/:id", to: "listings#update"
  delete "listings/:id", to: "listings#destroy"
  get "lisings/search", to: "listings#index"
  #test

  "listings/:listing_id/"
  resources :listings, only: %i[new show edit destroy create] do
    resources :bookings, only: %i[create new update show]
    resources :reviews, only: %i[index create]
  end

  resources :bookings, only: %i[index show update destroy] do
    resources :reviews, only: %i[new ]
  end

end
