class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
      #TODO is this something where I should put hte green type "you made a new user?"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to user_path(user)
    #TODO andother one I might have to come back to to update
  end

  def destroy
    #need to add validations in the model
    User.find(params[:id]).destroy
    redirect_to user_path
  end

  private
  def user_params
    return params.require(:user).permit(:user_name)
  end

end
