Rails.application.routes.draw do

  root to: 'works#index'

  get '/works', to: 'works#index'
  # put '/works/:id', to: 'works#update'

  post 'works/:id/upvote', to: 'works#upvote', as: 'upvote'

  # patch '/works/:id', to: 'works#update'

  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/new', to: 'books#new', as: 'new_book'
  get '/works/:id/edit', to: 'works#edit', as: 'edit_work'
  get '/works/:id', to: 'works#show', as: 'work'
  put '/works/:id', to: 'works#update'
  delete '/works/:id', to: 'works#destroy'

  get '/albums', to: 'albums#index'
  post '/albums', to: 'albums#create'
  get '/albums/new', to: 'albums#new', as: 'new_album'

  get '/movies', to: 'movies#index'
  post '/movies', to: 'movies#create'
  get '/movies/new', to: 'movies#new', as: 'new_movie'

  # post '/works', to: 'movies#create'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

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
