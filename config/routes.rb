Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

     root to: 'home#index'

     get '/home', to: 'home#index'
     get '/albums', to: 'home#albums', as: 'albums'
     get '/books', to: 'home#books', as: 'books'
     get '/movies', to: 'home#movies', as: 'movies'

     get '/submissions/:id/upvote', to: 'submissions#upvote', as: "upvote_submission"

     get "/login", to: "sessions#form"
     post "/login", to: "sessions#login"
     delete "/logout", to: "sessions#logout"

     resources :users, :submissions, :votes

end
