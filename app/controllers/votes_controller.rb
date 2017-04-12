class VotesController < ApplicationController

  def create
    if !session[:user_id]
      flash[:error] = "Not logged in"
      redirect_to :back
    else
      user = User.find_by_id(session[:user_id])
      if session[:user_id] && !user.duplicate_vote?(params[:id]) #user hasn't already voted for this work
        @vote = Vote.new
        @vote.user_id = session[:user_id]
        @vote.work_id = params[:id]
        if @vote.save
          flash[:success] = "Successfully upvoted!"
          redirect_to :root
        else
          flash.now[:error] = "Sorry, something went wrong and your vote was not counted."
        end
      else
        flash[:error] = "Could not upvote. User has already voted for this work."
      end

    end
  end


  private



end
