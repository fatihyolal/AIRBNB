Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/listings/:id/edit", to: "listings#edit", as: :listing_edit
  patch "listings/:id", to: "listings#update"
  delete "listings/:id", to: "listings#destroy"
  get "listings/search", to: "listings#index"
  get "bookings", to: "bookings#index"
  #test


  resources :listings, only: %i[new show edit destroy create] do
    resources :bookings, only: %i[create new]
    # resources :reviews, only: %i[create new]
  end
  resources :bookings, only:%i[show update]

end
