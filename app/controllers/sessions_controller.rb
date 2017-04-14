class SessionsController < ApplicationController

def login_form; end

def login
user = User.find_by_name(params[:name])

if user
session[:user_id] = user.id
  flash[:success] = "HELLO #{ user.name }"
  redirect_to root_path
else
  #did not find
  user = User.new
  user.id = params[:id]
  user.save
  # flash.now[:error] = "User not found"
  # render :login_form
end
end
end
