Rails.application.routes.draw do

  root 'works#index'

  resources :works #, except: [:new]
  resources :users, only: [:index, :show, :create]
  # resources :albums, only: [:index]

  get "/login", to: "sessions#login_form" #, as: "login_form"
  post "/login", to: "sessions#login" #, as: "login"

  delete "/login", to: "sessions#logout", as: "logout"

  get '/books', to: 'works#index_book', as: 'books'
  get '/albums', to: 'works#index_album', as: 'albums'
  get '/movies', to: 'works#index_movie', as: 'movies'

  get '/works/:id/upvote', to: 'works#vote', as: 'upvote'
  # get '/category/new', to: 'works#new', as: 'new_category'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
