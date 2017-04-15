class SessionController < ApplicationController


 def login
   @user = User.new
 end


  def create
    if params[:username] == ""
      flash[:error] = "You cannot have a blank username"
      render "login"
    end
    @user = User.find_by_username(params[:username])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.username}"
      redirect_to root_path
    else
      new_user = User.new
      new_user.username = params[:username]
      flash[:success] = "Welcome #{new_user.username}"
      redirect_to root_path
    end
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "You are successfully logged out"
    redirect_to root_path
  end

end
