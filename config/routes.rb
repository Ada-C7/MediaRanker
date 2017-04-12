Rails.application.routes.draw do
  resources :works
  resources :votes, except: [:edit, :update, :destroy]
  resources :users

  get 'albums', to: 'works#album_index', as: 'album_index'
  get 'books', to: 'works#book_index', as: 'book_index'
  get 'movies', to: 'works#movie_index', as: 'movie_index'
end
