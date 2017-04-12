Rails.application.routes.draw do
  root to: "works#index"

  get '/:category/new', to: 'works#new', as: 'new_work'

  resources :works, except: :new
end
