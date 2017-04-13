class SessionsController < ApplicationController

  def new
  end

  def create
    # If log in required a password, would make new users sign up on a new page
    @user = User.find_by(username: params[:username]) 
    @user ||= User.create(username: params[:username]) #if cant create what does it return?

    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:success] = "Successfully logged in as existing user #{@user.username}"
      # redirect_to root_path
      redirect_to works_path("albums")
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Successfully logged out"
    # redirect_to root_path
    redirect_to works_path("albums")
  end

end
