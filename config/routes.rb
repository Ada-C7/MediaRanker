Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :works
  resources :users
  root to: 'welcome#index' 

  get 'movies', to:'works#show_movies', as: 'movies'
  get 'books', to:'works#show_books', as: 'books'
  get 'albums', to:'works#show_albums', as: 'albums'


end
