Rails.application.routes.draw do

  root "welcome#index"


  get 'welcome/menu'
  get 'welcome/login'

  # get 'welcome/attempt_login'
  post 'welcome/attempt_login'

  get 'welcome/logout'


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
