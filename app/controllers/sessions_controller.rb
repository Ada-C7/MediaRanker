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
      new_user = User.create(name: params[:name])
      session[:user] = new_user.id
      session[:user_name] = new_user.name
      flash[:success] = "Thanks for joining, #{ new_user.name }!"
      redirect_to root_path
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
    flash[:success] = "See you next time!"
  end
end
