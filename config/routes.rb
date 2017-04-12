Rails.application.routes.draw do
  root to: "works#index"

  get ":category", to: "works#works_index", as: "works"

  get ":category/new", to: "works#new", as: "new_work"

  get ":category/:id/edit",  to: "works#edit", as: "edit_work"

  post ":category", to: "works#create"

  get ":category/:id",  to: "works#show", as: "work"

  patch ":category/:id", to: "works#update"

  delete ":category/:id", to: "works#destroy"

end
