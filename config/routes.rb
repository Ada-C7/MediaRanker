Rails.application.routes.draw do
  root "items#index"
  get 'item/index'
  get '/:category', to: 'items#category', as: 'category'
  get '/:category/new', to: 'items#new', as: 'new_item'
  post '/:category', to: 'items#create'
  resources :items
end
