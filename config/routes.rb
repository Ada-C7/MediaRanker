Rails.application.routes.draw do
  root to: "works#index", category: "all"

  ['book', 'album', 'movie'].each do |category|
    resources category.pluralize.to_sym, controller: "works", category: category
    patch "/#{category.pluralize}/:id/upvote", to: "works#upvote", as: "upvote_#{category}"
  end

  resources :users, only: [:show, :index]

  get '/login', to: "sessions#login_form"
  post '/login', to: "sessions#login"
  post '/logout', to: "sessions#logout"

end
