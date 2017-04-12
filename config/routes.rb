Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index', as: 'main'
  resources :users
  resources :works, except: [:index]


  get 'works/:work_category/index', to: 'works#index', as: 'list_works'

  # get 'works/new', to: 'works#new', as: 'new_work'
  # post 'works', to: 'works#create'
  # get 'works/:id', to: 'works#show', as: 'work'
  # get 'works/:id/edit', to: 'works#edit', as: 'edit_work'
  # patch 'works/:id', to: 'works#update'
  # delete 'works/:id', to: 'works#destory'


end


# root 'welcome#index', as: 'welcome'
# get 'tasks', to: 'tasks#index', as: 'tasks'
# get 'tasks/new', to: 'tasks#new', as: 'new_task'
# post 'tasks', to: 'tasks#create'
# get 'tasks/:id', to: 'tasks#show', as: 'task'
# get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
# patch 'tasks/:id', to: 'tasks#update'
# delete 'tasks/:id', to: 'tasks#destroy'
# patch  'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
