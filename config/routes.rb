Rails.application.routes.draw do
  root 'works#index', as: 'works'

  resources :works, only:[:index, :show]
  resources :books, only:[:index, :show]

end
