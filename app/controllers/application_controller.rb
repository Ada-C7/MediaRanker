class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def render_error
    render file: "#{ Rails.root }/public/500.html", status: 500
  end

  
end
