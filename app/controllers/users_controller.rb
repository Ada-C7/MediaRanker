class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  # def edit
  # end
  # 
  # def update
  # end
  #
  # def destroy
  # end

private
  def user_params
        return params.require(:user).permit( :username, :date_of_joining)
  end

end
