Rails.application.routes.draw do
  get 'votes/index'
  root 'welcome_page#index'

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  category_constraints = {category: /(books)|(movies)|(albums)/}

  get '/:category', to: 'works#index', constraints: category_constraints, as: "category"
  get '/:category/new', to: 'works#new', constraints: category_constraints, as: 'new_work'
  post '/:category', to: 'works#create', constraints: category_constraints

  resources :works, except: [:index, :create]

end
