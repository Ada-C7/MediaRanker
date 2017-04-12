Rails.application.routes.draw do
  get 'users/index'

 root "works#index"

 resources :works

 resources :users

 get "/:category", to: "works#show_category", as: 'category'

 get "/:category/new", to: "works#new", as: 'new_with_category'

end
