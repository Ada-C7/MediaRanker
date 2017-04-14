Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :works
  resources :users
  resources :votes, only: [:create]

  get 'movies', to: 'movies#index'
  get 'movies/new', to: 'movies#new'
  post 'movies', to: 'movies#create'

  get 'albums', to: 'albums#index'
  get 'albums/new', to: 'albums#new'
  post 'albums', to: 'albums#create'

  get 'books', to: 'books#index'
  get 'books/new', to: 'books#new'
  post 'books', to: 'books#create'

  # resources :welcome
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
