class SessionsController < ApplicationController

def login_form; end

def login
@user = User.find_by_name(params[:name])

if @user
session[:user_id] = @user.id
  flash[:success] = "HELLO #{ @user.name }"
  redirect_to user_path(@user.id)
else
  #did not find
  @user = User.create(user_params)
  flash[:success] = "User #{ @user.name} has been logged in"
  session[:user_id] = @user.id
  redirect_to user_path(@user.id)
  # flash.now[:error] = "User not found"
  # render :login_form
end
end

def logout

  session[:user_id] = nil
  flash[:success] = " You have been logged out "
  redirect_to root_path
end


private

def user_params
  params.permit(:name)

end
end
