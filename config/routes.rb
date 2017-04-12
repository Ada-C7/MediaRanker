Rails.application.routes.draw do

  root "works#index"

  resources :works
  get "/albums", to: "works#albums"
  get "/books", to: "works#books"
  get "/movies", to: "works#movies"

  get 'votes/index'

  get 'users/index'
end
