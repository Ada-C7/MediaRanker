Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mainpages#index', as: 'mainpages'

  get 'albums', to:'works#album_index', as: 'albums'
  get 'movies', to:'works#movie_index', as: 'movies'
  get 'books', to:'works#book_index', as: 'books'

  get 'works/:id', to:'works#show', as: 'work'

  get 'users/new', to:'users#new', as:'new_user'
  post 'users', to:'users#create'
  get 'users/:id', to:'users#show', as:'user'
end
