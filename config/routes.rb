Rails.application.routes.draw do
  root "works#index"

  resources :works

  get "/albums", to: "albums#index"
  get "/books", to: "books#index"
  get "/movies", to: "movies#index"

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"



end
