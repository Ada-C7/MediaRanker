Rails.application.routes.draw do
  get 'works/index'

  root "works#index"

  resources :works
end
