Rails.application.routes.draw do
  get 'votes/index'

  get 'users/index'

  get 'books/index'

  get 'albums/index'

  get 'movies/index'

  root "works#index"

  resources :works

  get "/:mediatype", to: "works#mediatype_list"
end
