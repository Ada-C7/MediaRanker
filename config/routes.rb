Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :works
  resources :users
  root to: 'works#index'

  get 'movies', to:'works#show_movies', as: 'movies'
  get 'books', to:'works#show_books', as: 'books'
  get 'albums', to:'works#show_albums', as: 'albums'

  get 'movie/new', to:'works#new_movie', as: 'new_movie'
  get 'book/new', to:'works#new_book', as: 'new_book'
  get 'album/new', to:'works#new_album', as: 'new_album'

  post 'movies', to:'works#create'
  post 'albums', to:'works#create'
  post 'books', to:'works#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#
#   get 'tasks', to: 'tasks#index', as: 'tasks'
#   get 'tasks/new', to: 'tasks#new', as: 'new_task'
#   post 'tasks', to: 'tasks#create'
#
#   get 'tasks/:id', to: 'tasks#show', as: 'task'
#   get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
#
#   post 'tasks/:id/edit', to: 'tasks#edit'
#   patch 'tasks/:id', to: 'tasks#update'
#   post 'tasks/:id/completed', to: 'tasks#completed', as: 'completed_task'
#   delete 'tasks/:id', to: 'tasks#destroy'
#
# end
