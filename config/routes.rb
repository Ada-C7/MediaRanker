Rails.application.routes.draw do
  root "welcome#index"
  resources :works
    



  resources :users


end
