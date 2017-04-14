Rails.application.routes.draw do
  root 'works#index', as:'homepage'

  resources :works, except: [:index, :new]
  resources :users, only: [:index, :show, :create]

  get 'movies', to: 'works#movies', as: 'movies'
  get 'books', to: 'works#books', as: 'books'
  get 'albums', to: 'works#albums', as: 'albums'

  get 'books/new', to:'works#new_book', as: 'new_book'
  get 'albums/new', to:'works#new_album', as: 'new_album'
  get 'movies/new', to:'works#new_movie', as: 'new_movie'

  post 'works/:id/vote', to: 'works#vote', as: 'vote'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'
end
