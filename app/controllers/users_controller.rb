class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
  end

  def show
    @result_user = User.find_by_id(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, join_date)
  end
end
