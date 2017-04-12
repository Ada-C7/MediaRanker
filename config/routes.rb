Rails.application.routes.draw do

  resources :users


  get '/login', to: 'sessions#login_form', as: 'login'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'


  root 'works#index'
  get 'works/index'
  get '/:category', to: 'works#show_category', as: 'category'


  resources :works





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
