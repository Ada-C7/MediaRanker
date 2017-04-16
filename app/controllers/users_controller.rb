class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id != nil
      redirect_to main_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.votes.destroy_all
    if @user == User.find(session[:user_id])
      session[:user_id] = nil
    end
    @user.destroy
    flash[:success] = "User #{@user.username} deleted!"
    redirect_to main_path
  end

  def show
    @user = User.find(params[:id])
    vote = Vote.find_by(user_id: @user.id)
  end

  private
  def user_params
    return params.require(:user).permit(:username)
  end

end
