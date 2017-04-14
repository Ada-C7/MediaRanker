class SessionsController < ApplicationController

  def new
    # user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])


    # redirect_to users_path

    if @user
      session[:user_id] = @user.id
      flash[:success] = "#{ @user.username } is successfully logged in"
      redirect_to root_path
    else
      flash.now[:failure] = "Sign up failed, try again"
      render :new
    end
  end

    def destroy
      session[:user_id] = nil
      flash[:logout] = "You're logged out!"
      redirect_to root_path
    end

  end
