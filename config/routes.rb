Rails.application.routes.draw do
  root "works#index"

  get "/albums", to: "albums#index", as: "albums_path"

  get "/books", to: "books#index", as: "books_path"

  get "/movies", to: "movies#index", as: "movies_path"


  resources :works

end
