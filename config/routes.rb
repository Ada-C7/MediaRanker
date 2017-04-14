Rails.application.routes.draw do
  root 'works#index', as: 'works'

  resources :works, only:[:index, :show, :edit, :update, :destroy]
  resources :books, only:[:index, :new, :create]
  resources :albums, only:[:index]

end
