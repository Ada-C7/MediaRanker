Rails.application.routes.draw do
  root 'homepage#index', as:'homepage'
  # need to change this - dont need all the restful routes
  resources :works

  get 'movies', to: 'works#movies', as: 'movies'
  get 'books', to: 'works#books', as: 'books'
  get 'albums', to: 'works#albums', as: 'albums'

end
