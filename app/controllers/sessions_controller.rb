class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by_name(params[:name])

    if user
      #found successfully
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_path
    else
      #did not find
      user = User.new
      user.name = params[:name]
      user.save
      session[:user_id] = user.id
      flash[:success] = "Created new user #{user.name}"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end
