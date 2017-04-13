Rails.application.routes.draw do
  root 'users#index'
  # post 'books/:id/mark_read', to: 'books
   #mark_read', as: 'mark_book_read'
  resources :users do
    resources :votes, except: [:new, :create]
  end
  resources :works
end
