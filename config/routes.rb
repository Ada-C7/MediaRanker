Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'works/index'

  get 'works/show'

  get 'works/edit'

  get 'works/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
