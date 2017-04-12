Rails.application.routes.draw do
  root to: "works#index", category: "all"
  
  resources :books, controller: "works", category: "book"
  resources :albums, controller: "works", category: "album"
  resources :movies, controller: "works", category: "movie"

  %w(book album movie).each do |category|
    get "/#{category.pluralize}", to: 'works#show_category', category: category
  end

end
