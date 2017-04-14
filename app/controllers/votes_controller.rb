class VotesController < ApplicationController

  def create
    vote = Vote.create vote_params
  end


  private

  def vote_params
    params.require(:vote).permit(:user_id, :content_id)
  end

end
