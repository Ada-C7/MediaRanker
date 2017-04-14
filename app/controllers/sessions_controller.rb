class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user
      session[:user_id] = user.id
      session[:username] = user.name
      flash[:success] = "Successfully logged in as existing user #{user.name} "
      redirect_to root_path
    else
      flash.now[:failure] = "Sorry, that user does not exist. Did you mean to create a new user?"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Successfully Logged Out"
    redirect_to root_path
  end

end
