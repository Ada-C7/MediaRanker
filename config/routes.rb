Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/works', to: 'works#index', as: 'works'
  get '/works/new', to: 'works#new', as: 'new_work'
  post '/works', to: 'works#create'
  get '/works/:id', to: 'works#show', as: 'work'
  get '/works/:id/edit', to: 'works#edit', as: 'edit_work'
  patch '/works/:id', to: 'works#update'
  put '/works/:id', to: 'works#update'
  delete '/works/:id', to: 'works#destroy'

  # TODO URLS that exist in model site
  # root welcome#index
  # '/works/:id'
  # '/works/:id/edit'
  # '/login'
  # '/users'
  # '/users/:id'

  # '/books'
  # '/movies'
  # '/albums'
  # each route goes to different controller#action BUT render the same view page

  # '/books/new'
  # '/movies/new'
  # '/albums/new'

end
