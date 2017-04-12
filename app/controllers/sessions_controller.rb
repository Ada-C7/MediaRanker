class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      session[:id] = @user.id
      flash[:succes] = "#{@user.username} is successfully logged in"
      redirect_to root_path
    end
  end

  def destroy
    session[:id] = nil
    flash[:logout] = "You are logged out"
    redirect_to root_path
  end
end
