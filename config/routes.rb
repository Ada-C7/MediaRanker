Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'


  get '/home', to: 'home#index'
  get '/albums', to: 'home#albums', as: 'albums'
  get '/books', to: 'home#books', as: 'books'
  get '/movies', to: 'home#movies', as: 'movies'

  resources :users, :submissions, :votes

end
