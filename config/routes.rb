Rails.application.routes.draw do
  categories = { works: /(albums)|(movies)|(books)/ }
  get ':works', to: 'works#index', as: 'works', constraints: categories
end
