Rails.application.routes.draw do
root 'welcome#index', as: "welcome"
  resources :users
  resources :votes

  get '/login', to: 'welcome#login_form'
  
  post '/login', to: 'welcome#login'

  delete "/logout", to: "welcome#logout"

  get '/albums', to: 'works#index', as: 'albums', category: 'album'

  get '/albums/new', to: 'works#new', as: 'new_album'

  post '/albums', to: 'works#create'

  get '/albums/:id', to: 'works#show', as: 'album'

  get '/albums/:id/edit', to: 'works#edit', as: 'edit_album'

  patch '/albums/:id', to: 'works#update'

  put '/albums/:id', to: 'works#update'

  delete '/albums/:id', to: 'works#destroy'


  get '/movies', to: 'works#index', as: 'movies', category: 'movie'

  get '/movies/new', to: 'works#new', as: 'new_movie'

  post '/movies', to: 'works#create'

  get '/movies/:id', to: 'works#show', as: 'movie'

  get '/movies/:id/edit', to: 'works#edit', as: 'edit_movie'

  patch '/movies/:id', to: 'works#update'

  put '/movies/:id', to: 'works#update'

  delete '/movies/:id', to: 'works#destroy'


  get '/books', to: 'works#index', as: 'books', category: 'book'

  get '/books/new', to: 'works#new', as: 'new_book'

  post '/books', to: 'works#create'

  get '/books/:id', to: 'works#show', as: 'book'

  get '/books/:id/edit', to: 'works#edit', as: 'edit_book'

  patch '/books/:id', to: 'works#update'

  put '/books/:id', to: 'works#update'

  delete '/books/:id', to: 'works#destroy'
end
