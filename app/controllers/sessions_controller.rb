class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      flash[:succes] = "#{@user.name} is successfully logged in"
      redirect_to root_path
    else
      flash[:no_user_found] = "Name does not match any user's name, please try it again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You are logged out"
    redirect_to root_path
  end
end
