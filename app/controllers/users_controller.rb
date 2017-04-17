class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.save nil
      redirect_to users_path
    else
      render :new, status: :bad_request
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :session)
  end
end
