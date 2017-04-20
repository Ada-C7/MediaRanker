class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_user

  private
  def find_user
    unless session[:user_id].nil?
      @login_user = User.find_by(id: session[:user_id])
    end
  end
end
