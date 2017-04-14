Rails.application.routes.draw do

  get 'votes/new'

  get 'votes/create'

  root 'contents#index'

  resources :books
  resources :movies
  resources :albums
  resources :votes, only: [:create, :update]

  post '/books/:book_id/', to: 'vote#create'
  post '/movies/:movie_id/', to: 'vote#create'
  post '/albums/:album_id/', to: 'vote#create'






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
