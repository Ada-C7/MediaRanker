class VotesController < ApplicationController

  def create
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to vote"
      # render "show/params[:content_id]"
    end
    vote = Vote.new
    vote[:user_id] = session[:user_id]
    vote[:content_id] = params[:content_id]
    vote.save

    if !vote.save

    else

    end
  end


  private

  def vote_params
    params.require(:vote).permit(:user_id, :content_id)
  end

end
