class VotesController < ApplicationController
  def create
    if !session[:user_id]
      flash[:error] = "You must log in to do that"
      redirect_back(fallback_location: :root)
    else
      @vote = Vote.new
      @vote.user_id = session[:user_id]
      @vote.work_id = params[:id]
      if !@vote.save
        flash[:error] = "Could not upvote. User has already voted for this work."
        redirect_to mainpages_path
      else
        flash[:success] = "Successfully upvoted!"
        redirect_to mainpages_path
      end
    end
  end
end
