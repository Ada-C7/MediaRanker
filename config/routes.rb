Rails.application.routes.draw do
  root 'works#index', as: 'works'

  resources :works, only:[:index, :show, :new, :create]
  resources :books, only:[:index, :show, :new, :create]
  resources :albums, only:[:index, :show]


end
