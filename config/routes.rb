Rails.application.routes.draw do
  categories = { works: /(albums)|(movies)|(books)/ }
  root 'home#index', as: 'home'

  get ':works', to: 'works#index', as: 'works', constraints: categories
  get ':works/new', to: 'works#new', as: 'new_work', constraints: categories
  post ':works', to: 'works#create', constraints: categories

  get 'works/:id', to: 'works#show', as: 'work'
  get 'works/:id/edit', to: 'works#edit', as: 'edit_work'
  patch 'works/:id', to: 'works#update'
  delete 'works/:id', to: 'works#destroy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users', to: 'users#index', as: 'users'
end
