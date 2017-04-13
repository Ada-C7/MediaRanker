class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create user_params

    if user.id != nil
      flash[:success] = "User added successfully"
      redirect_to user_path(user.id)
    else
      flash.now[:failure] = "Sign up failed, try again"
      render :new
    end
  end

  def show
    @user = find_user
    if @user.nil?
      head :not_found
    end
  end
private

  def find_user
    User.find_by(id: params[:id])
  end
end
