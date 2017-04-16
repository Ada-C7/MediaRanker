class SessionsController < ApplicationController

  def login
    session[:user_name]
    # user = User.find_by(user_name: params[:user_name])
    #
    # if user
    #   session[:user_id] = user.id
    #   flash[:success] = "#{ user.user_name } is successfully logged in"
    #   redirect_to root_path
    # end
  end

end
