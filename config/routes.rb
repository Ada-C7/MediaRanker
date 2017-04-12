Rails.application.routes.draw do
  categories = { works: /(albums)|(movies)|(books)/ }
  get ':works', to: 'works#index', as: 'works', constraints: categories

  get ':works/new', to: 'works#new', as: 'new_work', constraints: categories
end
