Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :works

  get '/books', to: 'works#index_movie', as 'books_path'
end
