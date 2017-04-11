Rails.application.routes.draw do
  root 'welcome#index'

  resources :works, except: [:index, :new, :create]
  resources :albums, only: [:index, :new, :create]
  resources :movies, only: [:index, :new, :create]
  resources :books, only: [:index, :new, :create]
  resources :users, only:  [:index, :show]

  #NEED LOGIN ROUTE W/ POST
end
