class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
    if !@user
      render_404
    end
  end

  # def create
  #   @user = User.create! user_params
  #   unless @user.id == nil
  #     flash[:sucess] = "Successfully created new user #{@user.name} with ID #{@user.id}"
  #   else
  #     render "new" #should go back to login page
  #   end
  # end
end
