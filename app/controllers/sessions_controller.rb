class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by(username: params[:username])

    unless user
      user = User.create(username: params[:username])
    end

    session[:user_id] = user.id
    flash[:success] = "Successfully logged in!"
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"
    redirect_to root_path
  end
end
