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
    @show_user = User.find params[:id]
    if !@show_user
      render_404
    end
  end

  def destroy
    @user = User.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
