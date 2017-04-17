Rails.application.routes.draw do
  root 'works#index'
  # post 'books/:id/mark_read', to: 'books
  #mark_read', as: 'mark_book_read'
  resources :users
  resources :works

  post 'works/:id/vote', to: 'works#vote', as: 'vote'

  get 'login', to: "sessions#new", as: 'login'

  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy', as: 'logout'
end
