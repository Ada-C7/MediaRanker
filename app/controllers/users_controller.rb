class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.id
      raise
      flash[:success] = "User added successfully"
      redirect_to user_path(user.id)
    else
      raise
      flash.now[:failure] = "Sign up failed, try again"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
