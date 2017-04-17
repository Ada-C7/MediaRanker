Rails.application.routes.draw do
  root 'welcome#index', as:'welcome'

  resources :votes
  resources :users
  resources :works

  get '/albums', to: 'works#albums', as: 'albums'
  # 'movies/new'
  get '/movies', to: 'works#movies', as: 'movies'
  get '/books', to: 'works#books', as: 'books'


# 'users/:user_id/:book_id' #this is a nested route - to use for the vote functionality - need both ids to create a new UserBook. need to make a new button - upvote button.

post 'works/:id/upvote', to: "works#upvote", as: 'upvote'

get 'login', to: 'sessions#new'

post 'login', to: 'sessions#create'

delete 'logout', to: 'sessions#destroy'

end
