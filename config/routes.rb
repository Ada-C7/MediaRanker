Rails.application.routes.draw do
  root 'welcome_page#index'
  resources :works, except: :index
  get '/:category', to: 'works#index', constraints: { category: /(books)|(movies)|(albums)/}, as: "category"
  end
