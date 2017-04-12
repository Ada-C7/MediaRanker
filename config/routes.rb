Rails.application.routes.draw do

  root 'works#index'
  resources :works
  # to automatically choose category from URL, need to write custom update and create methods to account for url var (book, movie, album)

  get '/albums', to: 'albums#index'
  get '/albums/new', to: 'albums#new', as: 'new_album'
  post '/albums', to:'albums#create'

  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new', as: 'new_book'
  post '/books', to:'books#create'

  get '/movies', to: 'movies#index'
  get '/movies/new', to: 'movies#new', as: 'new_movie'
  post '/movies', to:'movies#create'

end
