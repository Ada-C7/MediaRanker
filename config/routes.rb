Rails.application.routes.draw do

  root "works#index"

  resources :works
  get "work/:category", to: "works#show_category", as: "show_category"
  get "work/:category/new", to: "work#new_category", as: "new_category"
  # get "/albums", to: "works#albums"
  # get "/books", to: "works#books"
  # get "/movies", to: "works#movies"

  post 'work/:id/upvote', to: "votes#upvote", as: "upvote"

  get 'users', to: "users#index"
  get 'users/:id', to: "users#show", as: "user"

  get "/login", to: 'sessions#login_form'
  post "/login", to: 'sessions#login'
  delete "/login", to: 'sessions#logout'
end
