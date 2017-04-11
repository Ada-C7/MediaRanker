Rails.application.routes.draw do
  root 'homepage#index', as:'homepage'
  # need to change this - dont need all the restful routes
  resources :works

  get 'movies', to: 'homepage#movies', as: 'movies'
  get 'books', to: 'homepage#books', as: 'books'
  get 'albums', to: 'homepage#albums', as: 'albums'

end
