class UsersController < ApplicationController
  def index
    @users = User.all
    # .sort {|d1, d2| d1.id <=> d2.id}
  end

  def show
    @user=User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    unless @user.id == nil
      flash[:success] = "User added successfully"
      redirect_to user_path

    else
      flash.now[:error] = "Error has occured"
      render "new"
    end
  end




  def user_params
    params.require(:user).permit(:name)
  end

end
