Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #resources :users
  #resources :works #add upvote controller
  #

   resources :works, expect: [:index, :new, :create]
  # resources :albums, only: [:index, :new, :create]
  # resources :movies
  # resources :books
  # resources :users, only: [:index, :show]

  # resources :welcome
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
