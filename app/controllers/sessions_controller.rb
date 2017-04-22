class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      session[:username] = user.username
      flash[:status] = :success
      flash[:message] = "Successfully logged in as existing user #{ user.username }"
      redirect_to root_path

    else
      new_user = User.create(username: params[:username])
      session[:user_id] = new_user.id
      flash[:status] = :success
      flash[:message] = "Successfully created new user  #{new_user.username}  with ID #{new_user.id}"
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:status] = :success
    flash[:message] = "Successfully logged out"
    redirect_to root_path
  end

end
