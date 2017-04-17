class WelcomeController < ApplicationController

  def index
    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")
    @albums = Work.where(category: "album")
    # @highest_vote =
    #instance variable for each category + best
  end

  def login
    user_login = User.find_or_create(params[:username])
    session[:user_id] = user_login.id
    flash[:success] = "logged in as #{user_login.username}"
  User.save
  redirect to :index
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect to :index
  end

  def login_form;
  end
end
