Rails.application.routes.draw do
  root 'welcome#index'

  resources :works, except: [:index, :create, :new]
  resources :users, only:  [:index, :show]

  #albums
  get 'albums', to: 'works#albums_index'
  get 'albums/new', to: 'works#new_album', as: 'new_album'
  post 'albums/new', to: 'works#create_album'

  #movies
  get 'movies', to: 'works#movies_index'
  post 'movies/new', to: 'works#create_movie'
  get 'movies/new', to: 'works#new_movie', as: 'new_movie'

  #books
  get 'books', to: 'works#books_index'
  post 'books/new', to: 'works#create_book'
  get 'books/new', to: 'works#new_book', as: 'new_book'


  #Login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #Vote
  post 'works/:id/vote', to: 'works#vote', as: 'vote'

end
