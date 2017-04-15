Rails.application.routes.draw do
  root 'works#index'

  resources :works, only:[:index, :show, :edit, :update, :destroy]
  resources :books, only:[:index, :new, :create]
  resources :albums, only:[:index]
  resources :login, only:[:new, :create]

end
