class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @result_user = User.find_by_id(params[:id])
  end
end
