class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.id != nil
      flash[:success] = "User added successfully"
      session[:user_id] = @user.id
      session[:username] = @user.name
      flash[:success] = "Successfully logged in as user #{@user.name} "
      redirect_to root_path
    else
      flash.now[:failure] = "User did not save, try again"
      render :new, status: :bad_request
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
