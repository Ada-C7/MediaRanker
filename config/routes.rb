Rails.application.routes.draw do

  resources :works

  get "books", to:"works#books"

  get "movies", to:"works#movies"

  get "albums", to:"works#albums"

  get "login" , to:"sessions#login_form"
  post "login", to:"sessions#login"

  delete "logout", to:"sessions#logout" 


end
