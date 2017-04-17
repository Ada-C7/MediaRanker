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

  def referrer_or_root
    if request.referrer
      redirect_to request.referrer
    else
      redirect_to root_path
    end
  end

end
