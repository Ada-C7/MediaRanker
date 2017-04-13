class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id #bring up the record as an object
      flash[:success] = "#{user.username} is successfully logged in!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "See you soon!"
    redirect_to root_path
  end
end
