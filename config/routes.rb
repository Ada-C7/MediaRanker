Rails.application.routes.draw do
  root 'welcome#index', as: 'welcome'
  resources :works
  # resources :votes, except: [:edit, :update, :destroy]
  resources :users, except: [:edit, :update, :destroy, :new]

  get 'albums', to: 'works#album_index', as: 'albums'
  get 'books', to: 'works#book_index', as: 'books'
  get 'movies', to: 'works#movie_index', as: 'movies'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy', as: 'logout'

  post 'work/:id', to: 'works#vote', as: 'upvote'
end
