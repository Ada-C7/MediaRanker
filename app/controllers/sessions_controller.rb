class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by_name(params[:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{ user.name }"
      redirect_to root_path
    else
      user = User.create(name: params[:name])
      if user.id != nil
        session[:user_id] = user.id
        flash[:success] = "Successfully created new user #{user.name} with ID #{user.id}"
        redirect_to root_path
      else
        flash.now[:failure] = "Could not log in"
        flash.now[:error] = "username: can't be blank"
        render "login_form"
      end
    end
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
