class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @result_user = User.find(params[:id])
  end

def create
end
#   def create
#     @user = User.new(user_params)
#
#     if @user.save
#       flash[:success] = "You are logged in"
#       redirect_to @user
#     else
#       render 'login'
#     end
#   end
#
#   private
#
# def user_params
#   params.require(:user).permit(:name)
#
# end
end
