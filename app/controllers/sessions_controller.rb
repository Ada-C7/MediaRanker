class SessionsController < ApplicationController

  def new
    session[:user_id]
    flash[:success] = "successfully created new user #{ user.username } with ID #{ user.id }"
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.username } is successfully logged in"
      redirect_to root_path
    else
      render :new
   end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
