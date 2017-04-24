class WelcomeController < ApplicationController


  def index
    @books = Work.where(:category => "book")
    @movies = Work.where(:category => "movie")
    @albums = Work.where(:category => "album")


    # @username = User.find(session[:user_id]).name
    @user_id = session[:user_id]
  end

  def login
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    end
  end


  def logout

    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end




end
