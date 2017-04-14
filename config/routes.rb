Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mainpages#index', as: 'mainpages'

  get 'albums', to: 'works#album_index', as: 'albums'
  get 'albums/new', to: 'works#new', as: 'new_album'
  get 'movies', to: 'works#movie_index', as: 'movies'
  get 'movies/new', to: 'works#new', as: 'new_movie'
  get 'books', to: 'works#book_index', as: 'books'
  get 'books/new', to: 'books#book_index', as: 'new_book'

  resources :works, except: [:index, :new]

  resources :users, only: [:index, :show]

  get 'login', to:'sessions#login_form'
  post 'login', to:'sessions#login'
  get 'logout', to:'sessions#logout'

  get 'votes/new', to:'votes#new'
  post 'works/:id/votes', to: 'votes#create', as: 'new_vote'
  get 'votes', to:'votes#show', as: 'vote'
end
