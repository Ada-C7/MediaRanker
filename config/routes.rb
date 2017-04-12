Rails.application.routes.draw do

  root 'works#index', as: 'welcome'

  resources :works
  resources :users
  resources :votes

  get 'albums', to: 'works#albums', as: 'albums'
  get 'books', to: 'works#books', as: 'books'
  get 'movies', to: 'works#movies', as: 'movies'







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
