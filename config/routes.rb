Rails.application.routes.draw do
  root to: "works#index"

  resources :works, except: :new

  get '/:category/new', to: 'works#new', as: 'new_work'
  get '/:category', to: 'works#show_category', as: 'category'
end
