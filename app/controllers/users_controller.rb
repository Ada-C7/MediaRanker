class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    unless @user.id == nil
      flash[:success] = "User added successfully"
      redirect_to user_path

    else
      flash.now[:error] = "Error has occured"
      render "new"
    end
  end


  def user_params
    params.require(:user).permit(:name)
  end

end
