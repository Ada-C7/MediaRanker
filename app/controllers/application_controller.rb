class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def category_index(category)
    category_items = []
    Work.all.each do |w|
      if w.category == category
        category_items << w
      end
    end
    return category_items
  end
end
