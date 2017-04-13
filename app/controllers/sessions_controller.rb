class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by_name(params[:name])
    if user
      # code for returning user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.name}"
      redirect_to root_path
    else
      #create new user if name not found
      user = User.new
      user.name = params[:name]
      user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully created new user #{user.name} with ID #{user.id}"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
