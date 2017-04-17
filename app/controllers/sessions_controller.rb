class SessionsController < ApplicationController

  def new
  end

  def create
    # If log in required a password, would make new users sign up on a new page
    @user = User.find_by(username: params[:username])
    @user ||= User.create(username: params[:username])

    if params[:username].empty?
      flash[:failure] = "Could not log in"
      render :new
    else
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:success] = "Successfully logged in as #{@user.username}"
      redirect_to home_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to home_path
  end

end
