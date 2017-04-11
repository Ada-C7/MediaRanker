Rails.application.routes.draw do
  root "works#index"

  resources :works

  get "/:mediatype", to: "works#mediatype_list"
end
