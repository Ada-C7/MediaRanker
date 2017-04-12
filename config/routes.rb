Rails.application.routes.draw do
 root "works#index"

 resources :works


 get "/:category", to: "works#show_category", as: 'category'

 get "/:category/new", to: "works#new", as: 'new_with_category'

end
