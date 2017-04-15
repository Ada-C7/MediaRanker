class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id]) #returns nil
    if @user.nil?
      head :not_found
    end
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
    end
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def update
    user = User.find_by(id: params[:id])
    user.update_attributes(user_params)
    user.save
    redirect_to session[:return_to]
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to users_path
  end


  #PRIVATE
  private
  def user_params
    return params.require(:user).permit(:name)
  end

end
