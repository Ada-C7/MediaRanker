class UsersController < ApplicationController

  def index
    @users = Users.all
  end
end

def show
  @user = User.find_by_id(params[:id])
  #Book.find_by_id or whatever param you want and return nil if it doesn't find it - possibly the desired result
  if !user
    render_404
  end
end

def new
  @user = User.new
end

def create
  @user = User.create user_params
  puts @user.errors.messages
  if @user.id != nil
    flash[:success] = "Great job. Now you're a fucking Media Ranker."
    redirect_to users_path
  else
    flash.now[:error] = "Ooooo, Error 11! The olllde snack saddle is upon you."
    render "new"
  end
end
