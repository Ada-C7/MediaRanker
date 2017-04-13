class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.create(params[:name])
    if user
      session[:id] = user.id
      session[:name] = user.name
      flash[:success] = "Welcome, #{ user.name }"
      redirect_to :root
    else
      flash.now[:error] = "Invalid username"
      render :login_form
    end
  end

  def logout
    session.delete(:id)
    flash[:success] = "Successfully logged out"
    redirect_to :root
  end
end
