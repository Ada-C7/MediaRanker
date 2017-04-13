Rails.application.routes.draw do

  get 'sessions/index'

  root "media_ranker#index"

  resources :works
  resources :users
  resources :books
  resources :albums
  resources :movies


  post "/votes/upvote", to: "votes#upvote"

  get "/login", to: "sessions#login_form"

  post "/login", to: "sessions#login"

  delete "/logout", to: "sessions#logout"

end
