class SessionsController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.find_by(name: params[:username])

    if user
      session[:user_id] = user.id
      flash[:succes] = "#{user.name} is successfully logged in"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You are logged out"
    redirect_to root_path
  end
end
