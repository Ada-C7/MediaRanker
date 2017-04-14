Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "works#index"

    post 'works/:id/upvote', to:'votes#upvote', as: 'upvote'

    resources :works

    get '/login', to: 'sessions#login_form', as:'login'
    post '/login', to: 'sessions#login'
    delete '/logout', to: 'sessions#logout'


    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

    get '/movies', to: 'movies#index', as: 'movies'
    get '/movies/new', to:'movies#new', as: 'new_movie'
    post '/movies', to:'movies#create'


    get '/books', to: 'books#index', as: 'books'
    get '/books/new', to:'books#new', as:'new_book'
    post '/books', to: 'books#create'


    get '/albums', to: 'albums#index', as: 'albums'
    get '/albums/new', to:'albums#new', as: 'new_album'
    post '/albums', to:'albums#create'
end
