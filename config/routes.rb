Rails.application.routes.draw do
  resources :books
  resources :movies
  resources :albums

  get 'contents/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
