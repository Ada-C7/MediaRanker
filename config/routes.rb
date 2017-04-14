Rails.application.routes.draw do
  get 'votes/index'

  root 'welcome_page#index'
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get '/:category', to: 'works#index', constraints: { category: /(books)|(movies)|(albums)/}, as: "category"
  get '/:category/new', to: 'works#new', constraints: { category: /(books)|(movies)|(albums)/}, as: 'new_work'
  post '/:category', to: 'works#create', constraints: { category: /(books)|(movies)|(albums)/}
  resources :works, except: [:index, :create]

end
