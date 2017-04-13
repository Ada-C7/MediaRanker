Rails.application.routes.draw do
  root 'welcome#index', as: 'welcome'
  resources :works
  resources :votes, except: [:edit, :update, :destroy]
  resources :users

  get 'albums', to: 'works#album_index', as: 'albums'
  get 'albums/:id', to: 'works#album_show', as: 'album'
  get 'books', to: 'works#book_index', as: 'books'
  get 'books/:id', to: 'works#book_show', as: 'book'
  get 'movies', to: 'works#movie_index', as: 'movies'
  get 'movies/:id', to: 'works#movie_show', as: 'movie'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy', as: 'logout'
end
