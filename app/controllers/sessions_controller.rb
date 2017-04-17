class SessionsController < ApplicationController
  def login_form; end

  def login
    # found successfully

    user = User.find_by_name(params[:name])
    if !user
      user = User.create(name: (params[:name]))
      flash[:success] = "Successfully created new user #{user.name}with ID #{user.id}"
    end
    session[:user_id] = user.id
    redirect_to works_path
  end

  def logout
    # session[:user_id] = nil
    session.delete(:user_id)
    flash[:success] = "You are successfully logged out"
    redirect_to works_path
  end
end
