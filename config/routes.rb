Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#index'

  resources :works

  get '/books', to: 'works#index_books', as: 'books'
  get '/albums', to: 'works#index_albums', as: 'albums'
  get '/movies', to: 'works#index_movies', as: 'movies'

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
end
