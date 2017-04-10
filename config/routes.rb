Rails.application.routes.draw do
  resources :works

  root to: "works#index"
end
