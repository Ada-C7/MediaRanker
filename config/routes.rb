Rails.application.routes.draw do
  get 'albums/index'

  get 'albums/show'

  get 'movies/index'

  get 'movies/show'

  get 'books/index'

  get 'books/show'

  get 'contents/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
