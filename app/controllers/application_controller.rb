class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :works_path, :work_path, :new_work_path, :upvote_path

  def works_path(category = params[:category])
    url_for(action: 'index', controller: 'works', category: category)
  end

  def work_path(category, id)
    url_for(action: 'show', controller: 'works', category: category, id: id)
  end

  def new_work_path(category)
    url_for(action: 'new', controller: 'works', category: category)
  end

  def upvote_path(category, id)
    url_for(action: 'upvote', controller: 'votes', category: category, id: id)
  end

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

end
