class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def logged_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

end
