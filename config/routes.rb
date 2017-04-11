Rails.application.routes.draw do

  resources :works

  get "books", to:"works#books"

  get "movies", to:"works#movies"

  get "albums", to:"works#albums"
end
