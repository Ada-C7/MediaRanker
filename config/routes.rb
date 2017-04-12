Rails.application.routes.draw do
  root "works#top_works"
  get 'albums', to: 'works#show_albums'
  get 'movies', to: 'works#show_movies'
  get 'books', to: 'works#show_books'

  get 'albums/new', to: 'works#new', as: 'new_album'
  get 'movies/new', to: 'works#new', as: 'new_movie'
  get 'books/new', to: 'works#new',  as: 'new_book'

  # post '/works/:id/votes', to: 'votes#create', as: 'new_vote'
  post 'works/:id/upvote', to: 'works#upvote',  as: 'upvote'

  resources :users
  resources :votes
  resources :works

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'



end
