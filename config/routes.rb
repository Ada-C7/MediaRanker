Rails.application.routes.draw do
  get 'albums', :to => 'albums#index'
  get 'books', :to => 'books#index'
  get 'movies', :to => 'movies#index'
  root "works#index" #root defaults to first one

  get "/login", to: "sessions#login_form", as: "login_form"
  post "/login", to: "sessions#login", as: "login"
  # post "/login", to: "sessions#login_existing", as: "login_existing"


  delete '/login', to: "sessions#logout", as: "logout"


  resources :books
  resources :movies
  resources :albums
  resources :users

  resources :works

  get 'votes/index'

  get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
