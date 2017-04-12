Rails.application.routes.draw do
  get 'movies/index'

  get 'books/index'

  get 'albums/index'

  # get 'works/index'

  root "works#index"

  resources :works

  # get "/works/:category", to: "albums#index", as: "albums_path"
  #
  # to: "books#index", as: "books_path"
  #
  # to: "movies#index", as: "movies_path"

end
