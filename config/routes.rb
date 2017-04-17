Rails.application.routes.draw do
  # welcome page shows top 10 of all three works
  root 'works#home'
  get '/:media_type', to: 'works#index', as: "works", constraints: { media_type: /(albums)|(movies)|(books)/ }
  get '/:media_type/new', to: 'works#new', as: 'new_work', constraints: { media_type: /(albums)|(movies)|(books)/ }
  post '/works', to: 'works#create'
  get '/works/:id', to: 'works#show', as: 'work'
  get '/works/:id/edit', to: 'works#edit', as: 'edit_work'
  patch '/works/:id', to: 'works#update'
  delete '/works/:id', to: 'works#destroy'

  resources :users
  resources :votes

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
