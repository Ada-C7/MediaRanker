class WelcomeController < ApplicationController


  def index
    @books = Work.where(:category => "book")
    @movies = Work.where(:category => "movie")
    @albums = Work.where(:category => "album")


    @name = session[:name]
    @user_id = session[:user_id]
  end

  def login

  end


  def logout
    session[:user_id]=nil
    session[:name]=nil
    flash[:notice] = 'You have logged out'
    redirect_to root_path
  end

  def attempt_login
    if params[:name].present?
      found_user = User.where(:name => params[:name]).first

      if found_user
        session[:user_id] = found_user.id
        session[:name]= found_user.name
        # flash[:notice] = 'You are logged in"
        redirect_to(root_path)
      end
    end
  end
end
