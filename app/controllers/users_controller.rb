class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  #Create a user
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      flash[:success] = "Successfully created new user #{user.username} with ID #{user.id}"
      redirect_to mainpages_path
    else
      render :new
    end
  end

  private
  def user_params
    return params.require(:user).permit(:username)
  end
end
