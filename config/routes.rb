Rails.application.routes.draw do

  get 'votes/index'

  root "welcome#index"


  get 'welcome/menu'
  get 'welcome/login'

  # get 'welcome/attempt_login'
  post 'welcome/attempt_login'

  get 'welcome/logout'


  resources :works do
    member do
      # resource :vote, module: :works
      get :delete
      get :upvote
      # post :upvote

    end
  end



  resources :users
  #   member do
  #     get :delete
  #
  # end


end
