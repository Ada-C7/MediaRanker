Rails.application.routes.draw do
  get 'welcome/index'

  root to: 'welcome#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get '/:category', to: 'works#index', constraints: { category: /(books)|(movies)|(albums)/}, as: "category"
  get '/:category/new', to: 'works#new', constraints: { category: /(books)|(movies)|(albums)/}, as: 'new_work'
  post '/:category', to: 'works#create', constraints: { category: /(books)|(movies)|(albums)/}

  resources :works, except: [:index, :create] do
    member do
      post 'vote'
    end
  end

  # get 'movies/index'
  #
  #
  # get 'movies/new', to: 'movies#new', as: 'new_movie'
  # post 'movies', to: 'movies#create'
  # get 'movies/:id', to: 'movies#show', as: 'movie'
  #
  #
  # get 'votes/index'
  #
  # get 'users/index'
  #
  # get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
