Rails.application.routes.draw do
  resources :works
  resources :votes, except: [:edit, :update, :destroy] 
  resources :users
end
