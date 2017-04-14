class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.save
      flash[:welcome] = "Welcome to TehutRanker #{params[:username]}!"
      redirect_to users_path
    else
      redirect_to new_users_path
      flash[:failure] = "We could not create your account"
    end

  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    return params.require(:user).permit(:username)
  end
end
