Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  post '/works/:id/upvote', to: "votes#create", as: 'upvote'

  resources :works, except: [:new]
  resources :movies, except: [:destroy, :create, :show, :edit, :update]
  resources :albums, except: [:destroy, :create, :show, :edit, :update]
  resources :books, except: [:destroy, :create, :show, :edit, :update]

  resources :users, except: [:destroy, :edit, :update]
  resources :votes, except: [:new, :destroy, :edit, :update, :index]

end
