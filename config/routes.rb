Rails.application.routes.draw do
  root 'welcome#index'

  resources :works, except: [:index, :create, :new]
  # resources :albums, only: [:index, :new, :create]
  # resources :movies, only: [:index, :new, :create]
  # resources :books, only: [:index, :new, :create]
  resources :users, only:  [:index, :show]

  #albums
  # DONE: albums GET    /albums(.:format)         albums#index
  #        POST   /albums(.:format)         albums#create
  # new_album GET    /albums/new(.:format)     albums#new
  get 'albums', to: 'works#albums_index'
  get 'albums/new', to: 'works#new_album', as: 'new_album'
  post 'albums/new', to: 'works#create_album'

  #movies
  # movies GET    /movies(.:format)         movies#index
  #        POST   /movies(.:format)         movies#create
  # new_movie GET    /movies/new(.:format)     movies#new
  get 'movies', to: 'works#movies_index'
  post 'movies/new', to: 'works#create_movie'
  get 'movies/new', to: 'works#new_movie', as: 'new_movie'

  #books
  #  books GET    /books(.:format)          books#index
  #        POST   /books(.:format)          books#create
  # new_book GET    /books/new(.:format)      books#new
  get 'books', to: 'works#books_index'
  post 'books/new', to: 'works#create_book'
  get 'books/new', to: 'works#new_book', as: 'new_book'


  #NEED LOGIN ROUTE W/ POST
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end



# Prefix Verb   URI Pattern               Controller#Action
#   root GET    /                         welcome#index
# edit_work GET    /works/:id/edit(.:format) works#edit
#   work GET    /works/:id(.:format)      works#show
#        PATCH  /works/:id(.:format)      works#update
#        PUT    /works/:id(.:format)      works#update
#        DELETE /works/:id(.:format)      works#destroy
#  users GET    /users(.:format)          users#index
#   user GET    /users/:id(.:format)      users#show
# albums GET    /albums(.:format)         users#albums_index
#        POST   /albums(.:format)         users#create_album
# new_album GET    /albums/new(.:format)     users#new_album
# movies GET    /movies(.:format)         users#movies_index
#        POST   /movies(.:format)         users#create_movie
# new_movie GET    /movies/new(.:format)     users#new_movie
#  books GET    /books(.:format)          users#books_index
#        POST   /books(.:format)          users#create_book
# new_book GET    /books/new(.:format)      users#new_book
#  login GET    /login(.:format)          sessions#new
#        POST   /login(.:format)          sessions#create
#        DELETE /login(.:format)          sessions#destroy
