Rails.application.routes.draw do

  root "works#index"
  post "/works/:id/upvote", to: "votes#upvote", as: "upvote"

  resources :works, except: [:new]
  # get "/albums", to: "works#albums"
  # get "/books", to: "works#books"
  # get "/movies", to: "works#movies"


  get '/users', to: "users#index"
  get '/users/:id', to: "users#show", as: "user"

  get "/login", to: 'sessions#login_form'
  post "/login", to: 'sessions#login'
  delete "/login", to: 'sessions#logout'
  
  get "/:category", to: "works#show_category", as: "show_category"
  get "/:category/new", to: "works#new_category", as: "new_category"
end
