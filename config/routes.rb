Rails.application.routes.draw do
 root "works#index"



 resources :works

 get "/:category", to: "works#show_category", as: :category

end
