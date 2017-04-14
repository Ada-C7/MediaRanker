class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by(username: params[:username])

    if user
      flash[:success] = "Successfully logged in as existing user #{user.username}"
    else
      user = User.create(username: params[:username])
      flash[:success] = "Successfully created new user #{user.username} with ID #{user.id}"
    end

    session[:user_id] = user.id
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"
    redirect_to root_path
  end
end
