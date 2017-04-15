class VotesController < ApplicationController

  def create
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
