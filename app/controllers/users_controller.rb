class UsersController < ApplicationController
  def index
    user_name
    @users = User.all
  end

  def show
    user_name
    @result_user = User.find_by_id(params[:id])
    if !@result_user
      render_404
    end
  end

  def create
    user_name
    @user = User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
