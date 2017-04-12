  Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'items#index'

  get 'items/:category', to: 'items#index_by_category', as: 'category_index'

  get 'items/:category/new',   to:'items#new', as:'new_item'
  post 'items/:category',   to:'items#create'
  resources :items

end
