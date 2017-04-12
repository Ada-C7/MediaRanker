Rails.application.routes.draw do
  categories = { works: /(albums)|(movies)|(books)/ }
  get ':works', to: 'works#index', as: 'works', constraints: categories
  get ':works/new', to: 'works#new', as: 'new_work', constraints: categories
  post 'works', to: 'works#create' #go through :works instead?

  get 'works/:id', to: 'works#show', as: 'work'
end
