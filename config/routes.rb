Rails.application.routes.draw do


  get '/users', to: 'users#index'


  get '/login', to: 'sessions#login_form', as: 'login'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'


  root 'works#index'
  get 'works/index'
  get '/:category', to: 'works#show_category', as: 'category'

  post '/works/:id/upvote', to: 'works#upvote', as: 'upvote'

  resources :works

  get '/votes/index', to: 'votes#index'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
