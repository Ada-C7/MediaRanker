Rails.application.routes.draw do
  root 'works#index'

  get 'movies/index'

  get 'books/index'

  get '/works', to: 'works#index'

  # get '/works/new', to: 'works#new', as: 'new_work'

  get '/books/new', to: 'books#new', as: 'new_book'
  post '/books', to: 'books#create'

  post 'works', to: 'books#create'

  get '/works/:id', to: 'works#show', as: 'work'



  get '/albums', to: 'albums#index'

  get '/movies', to: 'movies#index'

  get '/books', to: 'books#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
