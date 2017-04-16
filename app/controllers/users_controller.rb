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
      flash.now.alert = "Username already exists. Choose something else!"
      render :new, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
    else
      @user.votes.destroy_all
      if @user == User.find(session[:user_id])
        session[:user_id] = nil
      end
      @user.destroy
      flash[:success] = "User #{@user.username} deleted!"
      redirect_to main_path
    end
  end

  private
  def user_params
    return params.require(:user).permit(:username)
  end

end
