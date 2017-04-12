Rails.application.routes.draw do
  root "works#index"

  get "/albums", to: "albums#index"

  get "/books", to: "books#index"

  get "/movies", to: "movies#index"


  resources :works

end
