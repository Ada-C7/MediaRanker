Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # welcome page shows top 10 of all three works
  root 'welcome#index'
  get '/:media_type', to: 'works#index', as: 'works', constraints: { media_type: /(albums)|(movies)|(books)/ }
  get '/:media_type/:id', to: 'works#new', as: 'new_work', constraints: { media_type: /(albums)|(movies)|(books)/ }
  post '/works', to: 'works#create'
  get '/works/:id', to: 'works#show', as: 'work'
  get '/works/:id/edit', to: 'works#edit', as: 'edit_work'
  patch '/works/:id', to: 'works#update'
  delete '/works/:id', to: 'works#destroy'

  # '/login'
  # '/users'
  # '/users/:id'
end
