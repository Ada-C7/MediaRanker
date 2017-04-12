Rails.application.routes.draw do
  root to: "works#index", category: "all"

  resources :books, controller: "works", category: "book"
  resources :albums, controller: "works", category: "album"
  resources :movies, controller: "works", category: "movie"
end
