Rails.application.routes.draw do
  root "works#index"

resources :works
# resources :movies
# resources :books
# resources :albums
# resources :users
# resources :votes

get "/login", to: "sessions#login_form"#, as: "login_form"
post "/login", to: "sessions#login"#, as: "login"

delete "/login", to: "sessions#logout"

end
