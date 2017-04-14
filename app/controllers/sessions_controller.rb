class SessionsController < ApplicationController

  def new
    end

  def create
    user = User.find_by(name: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{ user.name }"
      redirect_to welcome_path
    else
      flash[:failure] = "User not found.  Try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Successfully logged out"
    redirect_to welcome_path
  end

end
