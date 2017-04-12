Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :works, except: [:new, :create]

get '/:category/new', to: 'works#new', as: 'new_work'
post '/:category', to: 'works#create'
get '/:category', to: 'works#index', as: 'category_path'
end
