class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    id = params[:id].to_i
    @user = User.find_by(id)
    #render error here unless @user exists
  end

  def new
    @new_user = User.new(params.permit(user: :username))
  end

  def create
    @new_user = User.new(params.permit(user: :username))
    if @new_user.save
      redirect_to root_path
    end
  end


end
