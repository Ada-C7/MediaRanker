Rails.application.routes.draw do

  root to: 'works#index'
  get 'votes/index'

  get 'users/index'

  get 'works/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
