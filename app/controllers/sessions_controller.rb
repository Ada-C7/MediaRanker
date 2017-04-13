class SessionsController < ApplicationController
  def login_form ; end

  def login
    user = User.find_by_name(params[:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_path
    else
      user = User.new
      user.name = params[:name]
      user.save
      session[:user_id] = user.id
      flash[:success] = "#{user.name} added!"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil

    flash[:success] = "You have been logged out"
    redirect_to root_path
  end

end
