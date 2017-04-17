class SessionsController < ApplicationController
  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.find_by(name: params[:name])
  #
  #   if @user
  #     session[:user_id] = @user.id
  #     flash[:succes] = "#{@user.name} is successfully logged in"
  #     session[:user_name] = "Logged in as #{@user.name}"
  #     redirect_to root_path
  #   else
  #     flash[:no_user_found] = "Name does not match any user's name (case sensitive!), please try it again, or create a new user."
  #     redirect_to login_path
  #   end
  # end

  def auth_callback
    auth_hash = request.env['omniauth.auth']

    user = User.find_by(oauth_provider: params[:provider], oauth_uid: auth_hash['uid'])

    if user.nil?
      user = User.from_github(auth_hash)

      if user.save
        session[:user_id] = user.id
        flash[:message] = "Successfully logged in as user #{user.username}"
      else
        flash[:message] = "Could not log in"
        user.errors.messages.each do |field, problem|
          flash[:field] = problem.join(', ')
        end
      end
    else
      session[:user_id] = user.id
      flash[:message] = "Welcome back, #{user.name}"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "You logged out"
    redirect_to root_path
  end
end
