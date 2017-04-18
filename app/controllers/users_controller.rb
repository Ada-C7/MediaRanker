class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    user = User.create user_params

    if user.id != nil
      flash[:success] = "User added successfully"
    else
      flash.now[:failure] = "Sign up failed, try again"
    end
  end

  def show
    @user = find_user
    if @user.nil?
      head :not_found
    end
  end

private

  def user_params
    return params.required(:user).permit(:username)
  end

  def find_user
    User.find_by(id: params[:id])
  end
end
