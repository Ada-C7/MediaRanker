Rails.application.routes.draw do
    root 'home#index', as: 'home'

    resources :users, only: [:new, :show, :index, :create]
    resources :works
    resources :votes, only: [:new, :create]
end
