class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # using save! or create! bang will give a rails error message and tell you what validation failed
    @user = User.create(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end
end
