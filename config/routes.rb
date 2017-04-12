Rails.application.routes.draw do
  root 'works#index'
  resources :works
  # to automatically choose category from URL, need to write custom update and create methods to account for url var (book, movie, album)

end
