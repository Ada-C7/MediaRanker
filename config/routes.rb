Rails.application.routes.draw do
  root "works#index"

  resources :works
  resources :users

  post 'works/:id/upvote', to:'votes#upvote', as: 'upvote'

  get "/login", to: "sessions#login_form"#, as: "login_form"
  post "/login", to: "sessions#login"#, as: "login"
  delete "/login", to: "sessions#logout"

  category_constraints = { category: /(albums)|(books)|(movies)/}
  get '/:category', to: 'works#index', as: 'works', constraints: category_constraints
  get '/:category/new', to: 'works#new', as: 'new_work', constraints: category_constraints
  post '/:category', to: 'works#create', constraints: category_constraints

end
