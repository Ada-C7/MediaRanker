class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def destroy
    @vote = Vote.destroy(params[:id])
    if vote.destroy
      redirect_to vote_path
    end
  end



end
