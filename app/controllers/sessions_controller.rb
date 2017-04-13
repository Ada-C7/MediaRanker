class SessionsController < ApplicationController

  #denotes empty controller action
  def login_form; end

  def login
    user = User.find_by_name(params[:name])
    if user
      #success!
      session[:user_id] = user.id

      flash[:success] = "Successfully logged in as existing user #{user.name}"
      redirect_to root_path
    else
      #user doesn't exist; create that user
      new_user = User.new
      new_user.name = params[:name]

      if new_user.save
        session[:user_id] = new_user.id
        flash[:success] = "Successfully logged in as new user #{new_user.name} with ID #{new_user.id}"
        redirect_to root_path
      end

    end

  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
