class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      redirect_to main_path
    else
      redirect_to new_user_path
    end
  end

  private
  def user_params
    return params.require(:user).permit(:username)
  end

end
