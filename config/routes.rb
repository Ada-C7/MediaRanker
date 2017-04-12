Rails.application.routes.draw do
  get 'albums', :to => 'albums#index'
  get 'books', :to => 'books#index'
  get 'movies', :to => 'movies#index'
  root "works#index" #root defaults to first one

  resources :books
  resources :movies
  resources :albums

  resources :works

  get 'votes/index'

  get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
