Rails.application.routes.draw do
  root "works#index"

  resources :works
  resources :albums, :books, :movies, only: [:index, :new]

  # get "/albums", to: "albums#index"
  # get "/books", to: "books#index"
  # get "/movies", to: "movies#index"

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"



end
