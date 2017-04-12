class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.date_of_joining = Date.today
    @user.save
    if @user.id != nil
      flash[:success] = "Successfully created"
      redirect_to root_path
    else
      flash[:failure] = "User wasn't created"
      render :new, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      head :not_found
    end
  end


private
  def user_params
    return params.require(:user).permit( :username)
  end

end
