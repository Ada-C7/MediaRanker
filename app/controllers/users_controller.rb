class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.id != nil
      flash[:success] = "User added successfully"
      redirect_to root_path
    else
      flash.now[:failure] = "User did not save, try again"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
