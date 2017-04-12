Rails.application.routes.draw do
  root 'welcome#index', as:'welcome'

  resources :votes
  resources :users
  resources :works

  get '/albums', to: 'works#albums', as: 'albums'
  get '/movies', to: 'works#movies', as: 'movies'
  get '/books', to: 'works#books', as: 'books'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
