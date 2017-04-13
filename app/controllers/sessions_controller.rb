class SessionsController < ApplicationController
  def login_form; end

  def login
    if User.find_by_name(params[:name])
      @user = User.find_by_name(params[:name])
    else
      @user = User.new
      @user.name = params[:name]
    end

    session[:id] = @user.id
    session[:name] = @user.name
    if @user.save
      flash[:success] = "Welcome, #{ @user.name }"
      redirect_to :root
    else
      flash.now[:error] = "Failed to log in"
      render works_path
    end
  end

  def logout
    session.delete(:id)
    flash[:success] = "Successfully logged out"
    redirect_to :root
  end
end
