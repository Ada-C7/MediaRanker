Rails.application.routes.draw do

  resources :users, except: :new

  root to: "works#index"

  get 'login', to: 'sessions#new'

  post 'login', to: "sessions#create"

  delete 'logout', to: "sessions#destroy"

  post ":category/:id/vote", to: "works#vote", as "vote"

  get ":category", to: "works#works_index", as: "works", constraints: { category: /(albums)|(movies)|(books)|(album)|(movie)|(book)/ }

  get "user/new", to: "users#new", as: "new_user"

  get ":category/new", to: "works#new", as: "new_work", constraints: { category: /(albums)|(movies)|(books)|(album)|(movie)|(book)/ }

  get "works/:id/edit",  to: "works#edit", as: "edit_work"

  post ":category", to: "works#create", constraints: { category: /(albums)|(movies)|(books)|(album)|(movie)|(book)/ }

  get "works/:id",  to: "works#show", as: "work"

  patch "works/:id", to: "works#update"

  delete "works/:id", to: "works#destroy"

end
