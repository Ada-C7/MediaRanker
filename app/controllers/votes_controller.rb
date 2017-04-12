class VotesController < ApplicationController

  # def create
  #   @vote = Vote.new
  #   @vote.work = params[:work_id]
  #   @vote.user = params[:user_id]
  #   @vote.save
  # end

  # def show
  #
  # end
  #
  # def edit
  #
  # end
  #
  # def update
  #
  #
  # end

  private
  def vote_params
      return params.require(:vote).permit(:id, :work_id, :user_id)
  end

end
