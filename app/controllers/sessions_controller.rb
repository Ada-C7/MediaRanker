class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      # flash[:success] = "#{ user.username } is successfully logged in as an existing user."
      redirect_to root_path
    else
      new_user = User.create(username: params[:username])
      session[:user_id] = new_user.id
      session[:username] = new_user.username
      flash[:success] = "Successfully created new user #{new_user.username} with ID #{new_user.id}"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You’re logged out!"
    redirect_to root_path
  end


end
