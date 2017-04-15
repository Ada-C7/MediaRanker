class VotesController < ApplicationController

  def create
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to vote"
    else
      user = User.find(session[:user_id])
      vote = Vote.new
      vote[:user_id] = user.id
      vote[:content_id] = params[:content_id]
      vote.save
    end

     redirect_back(fallback_location: root_path)

  end


end
