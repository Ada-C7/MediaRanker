class SessionsController < ApplicationController

  def login_form; end

  def login

    user_to_login = User.find_or_create(params[:username])
    session[:user_id] = user_to_login.id
    flash[:success] = "Logged in as #{ user_to_login.username }!"
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "You have been successfully logged out!"
    redirect_to root_path
  end
end
