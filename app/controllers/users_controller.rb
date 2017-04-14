class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @result_user = User.find(params[:id])
  end

  def create
  end

  private


end
