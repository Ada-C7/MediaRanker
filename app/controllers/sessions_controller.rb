class SessionsController < ApplicationController
  def login_form; end

  def login
    # raise
    if User.find_by_name(params[:name]) != nil
      @user = User.find_by_name(params[:name])
      flash[:success] = "Successfully logged in as existing user #{@user.id}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.create! name: params[:name]
      unless @user.id == nil
        session[:user_id] = @user.id
        flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
        redirect_to root_path
      else
        flash[:error] = "did not succesfully login"
        render "login" #should go back to login page
      end
    end
  end
#   @user = User.create! user_params
#     unless @user.id == nil
#       flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
#     else
#       render "login" #should go back to login page
#     end
#
#     flash[:success] = "Succesfully created new user #{user.name} with ID #{user.id}"
#     session[:user_id] = user.id
#     redirect_to root_path
# end

def login_existing
  @user = User.find_by_name(params[:name])
end

def logout
  session[:user_id] = nil
  flash[:success] = "successfully logged out"
  redirect_to root_path

end

# private
#
#   def user_params
#     params.require(:user).permit(:name)
#   end

end
