Rails.application.routes.draw do

  root to: 'works#index'

  get '/works', to: 'works#index'
  put '/works/:id', to: 'works#update'
  post 'works/:id/upvote', to: 'works#upvote', as: 'upvote'
  # patch '/works/:id', to: 'works#update'
  delete '/works/:id', to: 'works#destroy'

  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/new', to: 'books#new', as: 'new_book'
  get '/works/:id/edit', to: 'works#edit', as: 'edit_work'
  get '/works/:id', to: 'works#show', as: 'work'

  get '/albums', to: 'albums#index'
  get '/albums/new', to: 'albums#new', as: 'new_album'
  post '/albums', to: 'albums#create'
  # post '/works', to: 'album#create'

  get '/movies', to: 'movies#index'
  get '/movies/new', to: 'movies#new', as: 'new_movie'
  post '/movies', to: 'movies#create'
  # post '/works', to: 'movies#create'

  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index'

  get '/login', to: "sessions#login_form"
  post '/login', to: "sessions#login"

  put '/logout', to: "sessions#logout"



# post '/works', to: 'books#create'

 # get '/works/new', to: 'works#new'#, as: 'new_work'

  # put '/works/:id/edit', to: 'works#update'

  # put '/works/:id', to: 'albums#update'

  # put '/works/:id', to: 'movies#update'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
