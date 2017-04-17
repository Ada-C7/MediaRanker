class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.username}"
      redirect_to mainpages_path
    elsif
      user = User.create(username: params[:username])
      session[:user_id] = user.id
      flash[:success] = "Successfully created new user #{user.username} with ID #{user.id}"
      redirect_to mainpages_path
    else
      if user.errors.any?
        user.errors.each do |column, message|
          flash.now[:error] = "Could not log in #{message}"
        end
        render :login_form
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_to mainpages_path
  end

end
