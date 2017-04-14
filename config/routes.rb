Rails.application.routes.draw do
  root "works#index"

  resources :works
  resources :albums, :books, :movies, only: [:index, :new]


  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"

# get "/:category", to: "works#show_category", as: "category"
# get "/:category/new", to: "works#new", as: "new_work"

end
