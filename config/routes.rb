Rails.application.routes.draw do
  root "works#index"

resources :works
resources :movies
resources :books
resources :albums
# resources :users
# resources :votes

end


# get 'albums/index'
#
#   get 'books/index'
#
#   get 'movies/index'
#
#   get 'users/index'
#
#   get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
