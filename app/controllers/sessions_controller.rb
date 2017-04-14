class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.create(name: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.name }, with ID #{user.id} is successfully logged in!"
      redirect_to works_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You're logged out!"
    redirect_to logout_path
  end
end
