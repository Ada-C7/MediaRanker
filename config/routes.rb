Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "works#index"
    resources :works

    get '/login', to: 'sessions#login_form', as:'login'
    post '/login', to: 'sessions#login_form'

    get '/movies', to: 'movies#index', as: 'movies'

    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'
end
