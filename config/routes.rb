Rails.application.routes.draw do
  resources :works
  resources :votes, except: [:edit, :update, :destroy]
  resources :users

  get 'albums', to: 'works#album_index', as: 'album_index'
end
