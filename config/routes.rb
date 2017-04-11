Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # need to change this - dont need all the restful routes
  root 'homepage#index', as:'homepage'
  resources :works
end
