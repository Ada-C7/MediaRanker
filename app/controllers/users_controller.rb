class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      flash[:success] = "welcome back!"
      redirect_to works_path
    else
      flash[:failure] = "invalid username!"
  end

private
  def user_params
    params.require(:user).permit(:username)
  end
end
