class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user
      session[:user_id] = user.id
      session[:username] = user.name
      flash[:success] = "#{user.name} is logged in!!!"
      redirect_to root_path
    end
  end



  def destroy
    session[:user_id] = nil
    flash[:logout] = "You're logged out!"
    redirect_to root_path
  end

end
