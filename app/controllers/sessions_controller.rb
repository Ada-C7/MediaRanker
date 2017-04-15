class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:name]) # :username in params should be the same as in the form
    if user
      session[:user_id] = user.id # :user_id in session can be set to what we wnt to
      flash[:success] = "#{ user.name } is successfully logged in"
      redirect_to welcome_path

    end
  end

  def destroy
    session[:user_id ]= nil
    flash[:logout] = "You're logged out!"
    redirect_to welcome_path
  end


end
