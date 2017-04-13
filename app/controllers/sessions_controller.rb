class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.username} is successfully logged in"
      redirect_to main_path
    else
      flash.now.alert = "Invalid username"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You are logged out!"
    redirect_to main_path
  end

end

  #
  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   user = User.find_by_email(params[:email])
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #       redirect_to root_path, :notice => "Welcome back, #{user.email}"
  #     else
  #       flash.now.alert = "Invalid email or password"
  #       render "new"
  #     end
  # end
  #
  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_path
  # end
  #
  # private
  #   def login(user)
  #     session[:user_id] = nil
  #   end
