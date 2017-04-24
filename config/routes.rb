Rails.application.routes.draw do

  get 'votes/index'

  root "welcome#index"


  get 'welcome/menu'

  get 'welcome/login'
  post 'welcome/login'

  get 'welcome/logout'
  delete 'welcome/logout'

  get 'logout' => 'welcome#destroy'



  resources :works do
    member do
       resource :vote
      get :delete
      get :vote
      post :vote

    end
  end


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
    # member do
    #   get :delete



end
