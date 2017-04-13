class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      flash[:succes] = "#{@user.name} is successfully logged in"
      session[:user_name] = "Logged in as #{@user.name}"
      redirect_to root_path
    else
      flash[:no_user_found] = "Name does not match any user's name (case sensitive!), please try it again, or create a new user."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You are logged out"
    redirect_to root_path
  end
end
