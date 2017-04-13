class VotesController < ApplicationController
  def create
    if session[:user_id]
      vote = Vote.new
      vote.work_id = params[:id]
      vote.user_id = session[:user_id]
    else
      flash[:warning] = "You must be logged in to Vote"
      redirect_to login_path
    end
  end
end
