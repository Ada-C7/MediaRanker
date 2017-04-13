class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @result_user = User.find(params[:id])
  end
  # def new
  #   @user = User.new
  # end
end
