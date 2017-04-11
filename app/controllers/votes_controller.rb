class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.save
  end

  def show

  end

  def edit

  end

  def update


  end

  private
  def vote_params
      return params.require(:vote).permit(:id, :work_id, :user_id)
  end

end
