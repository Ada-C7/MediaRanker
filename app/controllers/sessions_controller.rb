class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.new
    if user
      session[:name] = user.name
      user.save
      flash[:success] = "Successfully created new user #{user.name} with ID #{user.id}"
      redirect_to root_path
    end
  end

  def logout
    session[]
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
