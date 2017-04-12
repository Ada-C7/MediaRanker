Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # welcome page shows top 10 of all three works
  # root 'welcome#index'
  # routes specifically needed for each media type

  # get '/movies', to: 'works#movies', as: 'movies'
  # get '/albums', to: 'works#albums', as: 'albums'
  # get '/books', to: 'works#books', as: 'books'
  get '/:media_type', to: 'works#index', as: 'works', constraints: { media_type: /(albums)|(movies)|(books)/ }

  # match '/books/new', to: 'works#new', as: 'new_book'
  # match '/albums/new', to: 'works#new', as: 'new_album'
  # match '/movies/new', to: 'movies#new', as: 'new_movie'
  get '/:media_type/:id', to: 'works#new', as: 'new_work', constraints: { media_type: /(albums)|(movies)|(books)/ }
  # post '/works', to: 'works#create'
  # get '/works/:id', to: 'works#show', as: 'work'
  # get '/works/:id/edit', to: 'works#edit', as: 'edit_work'
  # patch '/works/:id', to: 'works#update'
  # delete '/works/:id', to: 'works#destroy'

  # '/login'
  # '/users'
  # '/users/:id'
end
