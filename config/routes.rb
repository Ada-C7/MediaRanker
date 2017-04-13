Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "works#index", as:'home'
  resources :welcome,:works,:users

  post 'works/:id/vote', to: 'works#vote', as:'vote'

  get 'books', to: 'works#books_index'
  get 'albums', to: 'works#albums_index'
  get 'movies', to: 'works#movies_index'

  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
