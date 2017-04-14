class SessionController < ApplicationController

  def login
    user = User.find_by_username(params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.username}"
      redirect_to root_path
    else
      new_user = User.new
      user.username = params[:username]
      flash[:success] = "Welcome #{user.username}"
      redirect_to root_path
    end
  end

  def logout
    session.delete[:user_id]
    flash[:success] = "You are successfully logged out"
    redirect_to root_path

end
