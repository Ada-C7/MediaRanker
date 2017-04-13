Rails.application.routes.draw do
  root "works#index"

  resources :works
  resources :albums, :books, :movies, only: [:index, :new]


  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"



end
