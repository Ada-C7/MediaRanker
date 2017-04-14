Rails.application.routes.draw do
  root 'welcome#index', as:'welcome'

  resources :votes
  resources :users
  resources :works

  get '/albums', to: 'works#albums', as: 'albums'
  get '/movies', to: 'works#movies', as: 'movies'
  get '/books', to: 'works#books', as: 'books'

  # post 'books/:id/vote', to: 'books#buy', as: 'buy'  #put this method in the books controller

# 'users/:user_id/:book_id' #this is a nested route - to use for the vote functionality - need both ids to create a new UserBook. need to make a new button - upvote button.

get 'login', to: 'sessions#new'

post 'login', to: 'sessions#create'

delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
