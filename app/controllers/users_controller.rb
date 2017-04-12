class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def login
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to :root
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:username)
  end

end
