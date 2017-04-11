Rails.application.routes.draw do
  root "mediaranker#index"

  resources :works
end
