Rails.application.routes.draw do
  get 'users/index'

  # get 'works/index'

  resources :works
  # resources :albums, only: [:index]

  get '/books', to: 'works#index_book', as: 'books'
  get '/albums', to: 'works#index_album', as: 'albums'
  get '/movies', to: 'works#index_movie', as: 'movies'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
