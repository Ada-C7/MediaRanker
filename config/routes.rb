Rails.application.routes.draw do
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
  root "items#index"
  get 'item/index'
  get '/:category', to: 'items#category', constraints: { category: /(book)|(movie)|(album)/}, as: 'category'
  get '/:category/new', to: 'items#new', as: 'new_item'
  post '/:category', to: 'items#create'
  resources :items do
    member do
      post 'upvote'
    end
  end
  resources :users, except: [:edit, :update, :destroy]
end
