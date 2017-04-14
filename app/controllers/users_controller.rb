class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @result_user = User.find_by_id(params[:id])
    if !@result_user
      render_404
    end
  end

  def create
    @work = User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
