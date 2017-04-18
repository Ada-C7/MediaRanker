class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.find_by(username: params[:username])

    if user.nil?
      user = User.create(username: params[:username])
      if user.id != nil
        flash[:success_new_user] = "#{ user.username } added successfully"
      else
        flash.now[:failure] = "Sign up failed, try again"
        render :new, status: :bad_request
      end
    end

    session[:user_id] = user.id
    flash[:success] = "#{ user.username } is successfully logged in"
    redirect_to :homepage
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to :homepage
  end
end
