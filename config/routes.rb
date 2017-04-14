Rails.application.routes.draw do
  root 'users#index'
  # post 'books/:id/mark_read', to: 'books
  #mark_read', as: 'mark_book_read'
  resources :users
  resources :works

  post 'works/:id/vote', to: 'works#vote', as: 'vote'

  get ‘sessions/login’, to:
end
