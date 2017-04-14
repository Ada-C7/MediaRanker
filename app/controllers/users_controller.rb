class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @result_user = User.find(params[:id])
    @user_votes = Vote.where(user_id: params[:id])
  end
end
