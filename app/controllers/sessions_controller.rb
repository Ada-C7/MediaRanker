class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{ user.username }"
      redirect_to root_path

    else
      new_user = User.create(username: params[:username])
      session[:user_id] = new_user.id
      flash[:success] = "Successfully created new user  #{new_user.username}  with ID #{new_user.id}"
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Successfully logged out"
    redirect_to root_path
  end


end
