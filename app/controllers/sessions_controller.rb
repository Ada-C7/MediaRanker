class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{ user.username } is successfully logged in"
      redirect_to root_path
    end
  end

    def destroy
      # sesssion[:user_id] = nil
      # flash[:logout] = "You've logged out."

      # redirect_to root_path
    end

  end
