class SessionsController < ApplicationController

  def login_form; end

  def login
    user = User.find_by_name(params[:name])

    if user # found successfully
      session[:user] = user.id
      session[:user_name] = user.name
      flash[:success] = "Welcome back #{ user.name }!"
      redirect_to root_path
    else # did not find
      flash.now[:error] = "User not found"
      render :login_form
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
    flash[:success] = "See you next time!"
  end
end
