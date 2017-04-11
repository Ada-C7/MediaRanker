Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'works#index'
  get 'works/category', to: 'works#category', as: 'category' 
  get 'works/movies', to: 'works#movies', as: 'movies'
  get 'works/books', to: 'works#books', as: 'books'
  get 'works/albums', to: 'works#albums', as: 'albums'
  post '/works/:id/votes', to: 'votes#create', as: 'new_vote'

  resources :works
  resources :votes, only: [:show, :new]
  resources :users, only: [:index, :show, :new]



end
