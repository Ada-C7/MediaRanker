class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end

private

def user_params
  return params.require(:user).permit(:username)
end
