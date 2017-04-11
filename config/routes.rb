Rails.application.routes.draw do

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  get 'works/index'

  get 'books/index'

  get 'albums/index'

  get 'movies/index'

end
