class SessionController < ApplicationController


 def login
   @user = User.new
 end


  def create
    @user = User.new

    @find_user = User.find_by_username(params[:username])

    if(params[:username]) == nil
      flash[:error] = "You cannot have a blank username"
    elsif @find_user
      session[:user_id] = @find_user.id
      flash[:success] = "Welcome back #{@user.username}"
    else
      new_user = User.new
      new_user.username = params[:username]
      new_user.save

      flash[:success] = "Welcome #{new_user.username}"
    end
    redirect_to root_path
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "You are successfully logged out"
    redirect_to root_path
  end

end
