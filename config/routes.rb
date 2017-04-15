Rails.application.routes.draw do

  root 'contents#index'

  resources :books
  resources :movies
  resources :albums
  resources :votes, only: [:create, :update]
  resources :users, only: [:show]

  post '/books/:content_id/', to: 'votes#create', as: 'book_vote'
  post '/movies/:content_id/', to: 'votes#create', as: 'movie_vote'
  post '/albums/:content_id/', to: 'votes#create', as: 'album_vote'

  get '/login', to: 'session#login', as: 'login'
  post '/login', to: 'session#create', as: 'create_login'

  delete '/login', to: 'session#logout', as: 'logout'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
