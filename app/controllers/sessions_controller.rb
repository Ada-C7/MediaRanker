
  class SessionsController < ApplicationController
  def login_form; end

  def login
    # found successfully

    user = User.find_by_name(params[:name])
    if !user
      user = User.create(name: (params[:name]))
      session[:user_id] = user.id

      flash[:success] = "
Successfully created new user #{user.name}with ID #{user.id}"
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
    redirect_to works_path
  end
end
