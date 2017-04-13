class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.find_by(username: params[:username])

    if user.nil?
      user = User.create(username: params[:username])

      if user.id != nil
        flash[:success] = "#{ user.username } added successfully"
        session[:user_id] = user.id
        redirect_to :homepage
      else
        flash.now[:failure] = "Sign up failed, try again"
        render :new
      end

    elsif user
      session[:user_id] = user.id
      flash[:success] = "#{ user.username } is successfully logged in"
      redirect_to :homepage
    end
  end

  # method copied from textbook
  # def login
  #   user = User.find_by(username: params[:username])
  #
  #   if user
  #     session[:user_id] = user.id
  #     flash[:success] = "#{ user.name } is successfully logged in"
  #     redirect_to root_path
  #   end
  # end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Logged Out"
    redirect_to :homepage
  end
end
