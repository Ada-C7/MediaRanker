Rails.application.routes.draw do
  root 'welcome_page#index'
  resources :works, except: :index
end
