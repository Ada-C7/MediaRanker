Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users
  resources :works
  get '/:category', to:'works#index', constraints: { category: /(books)|(movies)|(albums)/}, as: "category"
  resources :votes #TODO check do I need this??

end
