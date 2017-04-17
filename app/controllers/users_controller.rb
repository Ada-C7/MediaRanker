class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @result_user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def destroy

  end

  def create
  end

  def new
  end

private

def user_params
  params.require(:user).permit(:name)
end

end
