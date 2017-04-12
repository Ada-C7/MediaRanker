Rails.application.routes.draw do
  get 'users/index'

  # get 'works/index'

  resources :works
  resources :movies, only: [:index]

  # get '/works', to: 'works#index_album'
  # get '/works', to: 'works#index_movie'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
