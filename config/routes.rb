Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :works, except: [:new, :create]

get '/:category/new', to: 'works#new', as: 'new_work'
get '/:category', to: 'works#show_category', as: 'category'
post '/:category', to: 'works#create'
post '/work/:id', to: 'works#upvote', as: 'upvote'
end
