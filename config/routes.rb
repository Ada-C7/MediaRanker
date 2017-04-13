Rails.application.routes.draw do

  root "works#index"

  resources :works
  get "/albums", to: "works#albums"
  get "/books", to: "works#books"
  get "/movies", to: "works#movies"

  post 'work/:id/upvote', to: "votes#upvote", as: "upvote"

  get 'users', to: "users#index"
  get 'users/:id', to: "users#show", as: "user"

  get "/login", to: 'sessions#login_form'
  post "/login", to: 'sessions#login'
  delete "/login", to: 'sessions#logout'
end
