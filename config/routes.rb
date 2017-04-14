Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'works#index'
  get 'works/movies', to: 'works#movies', as: 'movies'
  get 'works/books', to: 'works#books', as: 'books'
  get 'works/albums', to: 'works#albums', as: 'albums'

  resources :works

  post '/works/:id/votes', to: 'votes#create', as: 'new_vote'
  resources :votes, only: [:show, :new]

  resources :users, only: [:index, :show, :login, :create]

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#login'
  delete '/login', to: 'sessions#logout'



end
