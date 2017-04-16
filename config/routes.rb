Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#index"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"

  resources :works, except: [:index, :new]
  resources :movies, except: [:destroy, :create, :show, :edit, :update]
  resources :albums, except: [:destroy, :create, :show, :edit, :update]
  resources :books, except: [:destroy, :create, :show, :edit, :update]

  resources :users, except: [:destroy, :edit, :update, :new]

  post "/works/:work_id/listupvote", to:"votes#create_from_list", as: "list_vote"

  post "/works/:work_id/upvote", to:"votes#create", as: "vote"
end
