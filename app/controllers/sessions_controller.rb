class SessionsController < ApplicationController

  def login_form; end

  def login
    user = User.find_by_name(params[:name])

    if user
      flash[:success] = "Successfully logged in as #{ user.name }"
      session[:user_id] = user.id
      redirect_to root_path
    else
      #should create a new user (call user method??  REDIRECT?) if none found
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
