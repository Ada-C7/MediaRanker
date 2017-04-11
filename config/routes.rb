Rails.application.routes.draw do
  get 'books/index'

  get 'albums/index'

  get 'movies/index'

  resources :works

  get 'votes/index'

  get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
