Rails.application.routes.draw do
  root 'homepage#index', as:'homepage'
  # need to change this - dont need all the restful routes
  resources :works


end
