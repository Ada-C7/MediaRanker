class SessionsController < ApplicationController

  def login_form; end

  def login
    #raise
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      flash[:success] = "Hello, #{ user.name }!"
      redirect_to root_path
    else
      new_user = User.new
      new_user.name = params[:name]
      new_user.save
      session[:user_id] = new_user_id
      flash[:success] = "Great job. You're a Media Rancor now."
      redirect_to root_path
       #in this case, this is the same as render "new"
    end
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "You are successfully logged out."
    redirect_to root_path
  end

end
