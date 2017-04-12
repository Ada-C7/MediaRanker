class SessionsController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    user = User.find_by_name(params[:user][:name])

    if user
      #found successfully
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.name}"
      redirect_to root_path

    else
      #did not find; create new user with name from params
      new_user = User.create(name: params[:user][:name])
      session[:user_id] = new_user.id
      flash[:success] = "Successfully created new user #{new_user.name} with ID #{new_user.id}"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
