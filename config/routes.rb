Rails.application.routes.draw do
  root "works#index"

resources :works
resources :users
post 'works/:id/upvote', to:'votes#upvote', as: 'upvote'

get "/login", to: "sessions#login_form"#, as: "login_form"
post "/login", to: "sessions#login"#, as: "login"

delete "/login", to: "sessions#logout"

end
