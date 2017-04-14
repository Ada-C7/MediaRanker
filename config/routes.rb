Rails.application.routes.draw do
  root "works#index"

  resources :works, except: [:new]
  # resources :albums, :books, :movies, only: [:index, :new]


  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"

  get "/:category", to: "works#category_index", as: "category"
  get "/:category/new", to: "works#new", as: "new_work"

end
