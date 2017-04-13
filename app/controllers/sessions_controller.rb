class SessionsController < ApplicationController

  def login_form; end

  def login
    user = User.find_by_name(params[:name])

    if user
      flash[:success] = "Successfully logged in as #{ user.name }"
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = User.new
      user.name = params[:name]

      if user.save
        flash[:success] = "You have successfully logged in as new user #{ user.name }"
        session[:user_id] = user.id
        redirect_to users_path
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
