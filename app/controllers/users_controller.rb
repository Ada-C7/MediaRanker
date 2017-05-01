class UsersController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      flash[:succes] = "New user '#{@user.name}' created"
      redirect_to users_path
    else
      flash[:failure] = "Name cannot be blank, please try it again."
      redirect_to new_user_path
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
      @user.destroy
      redirect_to users_path
    end
  end

  private
  def user_params
    return params.require(:user).permit(:name)
  end

end
