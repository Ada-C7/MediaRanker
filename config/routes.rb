Rails.application.routes.draw do

  get 'votes/new'

  get 'votes/create'

  root 'contents#index'

  resources :books
  resources :movies
  resources :albums
  resources :votes, only: [:create, :update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
