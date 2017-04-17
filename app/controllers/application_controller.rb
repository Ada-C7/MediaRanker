class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def user_name
    @user = User.find_by_id(session[:user_id])
  end
end
