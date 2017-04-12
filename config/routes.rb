Rails.application.routes.draw do

  root "media_ranker#index"

  resources :works
  resources :users
  resources :votes
  resources :books


end
