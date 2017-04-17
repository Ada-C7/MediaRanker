Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index', as: 'main'
  resources :users
  resources :works, except: [:index]
  post 'works/:id/vote', to: 'works#vote', as: 'vote'
  get 'works/:work_category/index', to: 'works#index', as: 'list_works'
  get 'sessions/new', to: 'sessions#new', as: 'login'
  post 'sessions/new', to: 'sessions#create'
  delete 'sessions/:id', to: 'sessions#destroy', as: 'logout'
  # get 'works/new', to: 'works#new', as: 'new_work'
  # post 'works', to: 'works#create'
  # get 'works/:id', to: 'works#show', as: 'work'
  # get 'works/:id/edit', to: 'works#edit', as: 'edit_work'
  # patch 'works/:id', to: 'works#update'
  # delete 'works/:id', to: 'works#destory'


end
