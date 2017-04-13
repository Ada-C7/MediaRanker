class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      # flash[:success] = "Successfully logged in as existing user #{user.username}"
      # redirect_to root_path
      redirect_to works_path("albums")
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You're logged out!"
    # redirect_to root_path
    redirect_to works_path("albums")
  end

end
