class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new(params[:id])
  end

  def create
    @user = User.create(user_params)
  end

  # def delete
  #   @user = User.find(params[:id])
  # end
  #
  # def destroy
  #   user = User.find(params[:id])
  #   user.destroy
  #
  #   redirect_to users_path
  # end

  private

  def user_params
    return params.require(:user).permit(:username)
  end
end
