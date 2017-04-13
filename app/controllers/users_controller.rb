class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = find_user
    if @user.nil?
      head :not_found
    end
  end
private

  def find_user
    User.find_by(id: params[:id])
  end
end
