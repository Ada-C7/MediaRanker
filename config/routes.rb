Rails.application.routes.draw do
  get '/works', to: 'works#index'

  get '/works/:id', to: 'works#show', as: 'work'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
