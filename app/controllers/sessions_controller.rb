class SessionsController < ApplicationController

  def login_form
    @users = User.all
  end

  def login
    # raise
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.username}!"
      redirect_to :root
    else
      flash.now[:failure] = "Unable to find that user."
      render :login_form
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

end
