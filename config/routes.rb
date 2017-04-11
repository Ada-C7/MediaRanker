Rails.application.routes.draw do

  root 'welcome#index', as: 'welcome'

  resources :works, except: [:index]
  resources :users
  resources :votes




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
