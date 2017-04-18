class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.save
      flash[:welcome] = "Welcome to TehutRanker #{params[:username]}!"
      redirect_to users_path
    else
      render :new, status: :bad_request
      flash[:failure] = "We could not create your account"
    end

  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.nil?
      head :not_found
    else
      @user_votes = @user.votes
    end
  end


  private
  def user_params
    return params.require(:user).permit(:username)
  end
end
