Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'works#index'
  resources :works
  resources :votes, only: [:show, :new]
  resources :users, only: [:index, :show, :new]

  post '/works/:work_id/votes', to: 'trips#create', as: 'new_trip'


end
