Rails.application.routes.draw do

  root 'works#index'
  get '/:category', to: 'works#category_index'
  get '/:category/new', to: 'works#new', as: 'new_work'

  resources :works, except: [:new]

  post '/:id/upvote', to: 'votes#upvote', as: 'upvote'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # get '/albums', to: 'albums#index'
  # get '/albums/new', to: 'albums#new', as: 'new_album'

  # get '/books', to: 'books#index'
  # get '/books/new', to: 'books#new', as: 'new_book'

  # get '/movies', to: 'movies#index'
  # get '/movies/new', to: 'movies#new', as: 'new_movie'

end
