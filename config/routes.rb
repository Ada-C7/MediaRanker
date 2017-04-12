Rails.application.routes.draw do
  get 'works', to: 'works#index', as: 'works'
end
