Rails.application.routes.draw do

  root "welcome#index"


  get 'access/menu'
  get 'access/login'
  get 'access/attempt_login'
  get 'access/logout'


  resources :works do
    # member do
    #   get :delete
    #
    # end
  end


  resources :users
  #   member do
  #     get :delete
  #
  # end


end
