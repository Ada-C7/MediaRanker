class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:notice] = "#{ user.username } is successfully logged in"
    else
      new_user = User.new(username: params[:username])
      flash[:notice] = "new user created!"
      new_user.save
      session[:user_id] = new_user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
