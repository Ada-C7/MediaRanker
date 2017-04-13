Rails.application.routes.draw do

  get 'movies/index'

  get 'movies/new'

  get 'movies/:id', to: 'movies#show', as: 'movie'

  root to: 'works#index'
  get 'votes/index'

  get 'users/index'

  get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
