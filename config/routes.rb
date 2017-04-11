Rails.application.routes.draw do

  root 'works#index'
  get 'works/index'
  get '/:category', to: 'works#show_category', as: 'category'

  resources :works

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
