class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      # We know the validations didn't pass
      render :new, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    user.save

    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_path
  end

  private
  def user_params
    return params.require(:user).permit(:name)
  end
end
