Rails.application.routes.draw do

  resources :users, except: :new

  root to: "works#index"

  get 'login', to: 'sessions#new'

  post 'login', to: "sessions#create"

  delete 'logout', to: "sessions#destroy"

  get ":category", to: "works#works_index", as: "works"

  get "user/new", to: "users#new", as: "new_user"

  get ":category/new", to: "works#new", as: "new_work"

  get "works/:id/edit",  to: "works#edit", as: "edit_work"

  post ":category", to: "works#create"

  get "works/:id",  to: "works#show", as: "work"

  patch ":category/:id", to: "works#update"

  delete ":category/:id", to: "works#destroy"

# potentially use nested routes to create the upvotes

end
