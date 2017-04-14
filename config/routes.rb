Rails.application.routes.draw do

  root 'works#index', as: 'welcome'

  resources :works
  resources :users
  resources :votes

  get 'albums', to: 'works#albums', as: 'albums'
  get 'albums/new', to: 'works#new', as: 'new_album'

  get 'books', to: 'works#books', as: 'books'
  get 'books/new', to: 'works#new', as: 'new_book'
  
  get 'movies', to: 'works#movies', as: 'movies'
  get 'movies/new', to: 'works#new', as: 'new_movie'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
