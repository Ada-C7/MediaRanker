Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'items#index'

  resources :items, except: [:new, :create]
  post 'items/:id/vote', to: 'items#vote', as: 'vote'
  
  get 'users', to:'users#index', as:'users'
  get 'users/:id', to:'users#show', as: 'user'


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get ':category', to: 'items#index_by_category', as: 'category_index'
  get ':category/new',   to:'items#new', as:'new_item_by_category'
  post ':category',   to:'items#create'



end
