Rails.application.routes.draw do
  # did I mess things up by saying homepage...
  # how to globablly look for homepage
  root 'works#index', as:'homepage'
  # need to change this - dont need all the restful routes
  resources :works, except: [:index, :new]

  get 'movies', to: 'works#movies', as: 'movies'
  get 'books', to: 'works#books', as: 'books'
  get 'albums', to: 'works#albums', as: 'albums'

  get 'books/new', to:'works#new_book', as: 'new_book'
  get 'albums/new', to:'works#new_album', as: 'new_album'
  get 'movies/new', to:'works#new_movie', as: 'new_movie'
end
