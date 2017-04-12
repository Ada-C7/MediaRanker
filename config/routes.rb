Rails.application.routes.draw do
  root to: "works#index", category: "all"

  ['book', 'album', 'movie'].each do |category|
    resources category.pluralize.to_sym, controller: "works", category: category
    patch "/#{category.pluralize}/:id/upvote", to: "votes#upvote", as: "upvote_#{category}"
  end

end
