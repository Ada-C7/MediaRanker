Rails.application.routes.draw do
  get 'votes/index'

  get 'users/index'

  root "works#index"

  resources :works
end
