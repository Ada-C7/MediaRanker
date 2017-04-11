Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'albums', to: 'works#show_albums', as: 'albums'
  resources :welcome
  resources :users
  resources :votes
  resources :works


end
