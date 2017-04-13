Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mediaranker#index"

  resources :works, except: [:index, :new, :create]
  resources :votes, except: [:destroy, :edit, :update]
  resources :users, except: [:destroy, :edit, :update]

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"

  delete "/logout", to: "sessions#logout"

  get "/:category/new", to: "works#new", as: "new_category"
  post "/:category", to: "works#create"

  get "/:category", to: "works#show_category", as: "category"
end
