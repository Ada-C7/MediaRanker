Rails.application.routes.draw do
  resources :works

  root to: "works#index"

  %w(book album movie).each do |category|
    get "/#{category.pluralize}", to: 'works#show_category', category: category
  end
end
