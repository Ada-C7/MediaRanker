class SessionController < ApplicationController


 def login
   @user = User.new
 end


  def create
    @find_user = User.find_by_username(params[:session][:username])

    if(params[:session][:username]) == nil
      flash[:error] = "You cannot have a blank username"
    elsif @find_user
      session[:user_id] = @find_user.id
      flash[:success] = "Welcome back #{@find_user.username}"
    else
      new_user = User.new
      new_user.username = params[:session][:username]
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
