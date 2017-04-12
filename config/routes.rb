Rails.application.routes.draw do
  root to: "works#index"

  resources :works, except: :new

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"

  delete "/logout", to: "sessions#logout", as: "logout"

  get '/:category/new', to: 'works#new', as: 'new_work'
  get '/:category', to: 'works#show_category', as: 'category'
end
