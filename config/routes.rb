Rails.application.routes.draw do
    root 'home#index', as: 'home'

    resources :users, only: [:new, :show, :index, :create]
    resources :works
    resources :votes, only: [:new, :create]

    post 'works/:id/upvote', to: 'works#upvote', as: 'upvote'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    get '/albums', to: 'works#index', as: :albums
    get '/books', to: 'works#index', as: :books
    get '/movies', to: 'works#index', as: :movies
end
