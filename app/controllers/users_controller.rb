class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(work_params)

    if @user.save
      redirect_to user_path(@work.id)
    else
      render 'login_form'
    end
  end

  def show
    @user = User.find_by_id(params[:id])

    if !@user
      render_404 #find me in ApplicationController
    end
  end
end
