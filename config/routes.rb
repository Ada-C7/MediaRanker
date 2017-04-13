Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'items#index'


  resources :items, except: [:new, :create]


  # get 'items', to:'items#index'
  # get 'items/:id', to:'items#show', as: 'item'
  # get 'items/:id/edit', to:'items#edit', as: 'edit_item'
  # patch 'items/:id', to:'items#update'
  # delete 'items/:id', to:'items#destroy'

  get ':category', to: 'items#index_by_category', as: 'category_index'

  get ':category/new',   to:'items#new', as:'new_item_by_category'
  post ':category',   to:'items#create'

end
