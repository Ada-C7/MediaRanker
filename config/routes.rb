Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'works#index'
  get '/works/movies', to: 'works#movies', as: 'movies'
  get '/works/books', to: 'works#books', as: 'books'
  get '/works/albums', to: 'works#albums', as: 'albums'

  resources :works
  resources :votes, only: [:show, :new]
  resources :users, only: [:index, :show, :new]

  post '/works/:work_id/votes', to: 'trips#create', as: 'new_trip'


end
