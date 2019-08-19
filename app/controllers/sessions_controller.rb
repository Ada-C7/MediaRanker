class SessionsController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by_username(params[:username])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.username}"
      redirect_to root_path
    else
      @user = User.create(user_params)

      unless @user.id == nil
        session[:user_id] = @user.id
        flash[:success] = "Successfully created new user #{@user.username} with ID #{@user.id}"
        redirect_to root_path
      else
        flash.now[:error] = "Error has occurred"
        render "login_form"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.permit(:username)
  end
end
