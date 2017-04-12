Rails.application.routes.draw do

  get 'movies/index'

  get 'albums/index'

  root "media_ranker#index"

  resources :works
  resources :users
  resources :votes
  resources :books
  resources :albums
  resources :movies


end
