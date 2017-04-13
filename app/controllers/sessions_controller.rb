
  class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by_name(params[:name])
    # raise
    if user
      # found successfully
      session[:user_id] = user.id
      flash[:success] = "HELLO #{ user.name }"
      redirect_to works_path
    else
      # did not find
      flash.now[:error] = "User not found"
      render :login_form
    end
  end

  def logout
    # session[:user_id] = nil
    session.delete(:user_id)
    flash[:success] = "You are successfully logged out"
    redirect_to work_path
  end
end
