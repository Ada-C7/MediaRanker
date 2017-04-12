class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.username } is successfully logged in"
      redirect_to root_path
    else
      flash[:failure] = "User wasn't logged in, try again"
      render :new, status: :bad_request
    end
  end

end
