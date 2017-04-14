Rails.application.routes.draw do
  root "works#index"

  get 'sessions/index'

  get '/users', to: "users#index"
  get '/users/:id', to: "users#show", as: "user"

  get '/login', to: "sessions#login_form"
  post '/login', to: "sessions#login"

  delete '/logout', to: "sessions#logout"

  post '/works/:id/upvote', to: "votes#create", as: 'upvote'

  resources :works

  get "/:category", to: "works#show_category", as: 'category'

  get "/:category/new", to: "works#new", as: 'new_with_category'

end
