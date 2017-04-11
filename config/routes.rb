Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mediaranker#index"

  get "/:category", to: "works#show_category", as: "category"

  resources :works
  resources :votes
  resources :users
end
