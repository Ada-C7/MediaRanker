Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mainpages#index', as: 'mainpages'

  get 'albums', to:'works#album_index', as: 'albums'
  get 'movies', to:'works#movie_index', as: 'movies'
  get 'books', to:'works#book_index', as: 'books'

  resources :works, except: :index

  get 'users', to:'users#index', as:'users'
  get 'users/:id', to:'users#show', as:'user'

  get 'login', to:'sessions#login_form'
  post 'login', to:'sessions#login'
  get 'logout', to:'sessions#logout'

  get 'votes/new', to:'votes#new'
  post 'works/:id/votes', to: 'votes#create', as: 'new_vote'
  get 'votes', to:'votes#show', as: 'vote'
end
