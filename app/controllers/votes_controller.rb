class VotesController < ApplicationController

  def upvote
    params[:work_id]
    @vote = Vote.create

    if @vote.id != nil
      redirect_to votes_path
    end
  end

end
