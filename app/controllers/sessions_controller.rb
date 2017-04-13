class SessionsController < ApplicationController
  def login_form; end

  def login
    # need to give them user id
    flash[:success] = "Login successful!"
  end

  def logout
    # session[:user_id] = nil
    flash[:success] = "You have been successfully logged out!"
    redirect_to root_path
  end
end
