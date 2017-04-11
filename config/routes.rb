Rails.application.routes.draw do
  root "items#index"
  get 'item/index'
  get '/albums', to: 'items#albums', as: 'albums'
  get '/books', to: 'items#books', as: 'books'
  get '/movies', to: 'items#movies', as: 'movies'
  resources :items
end
