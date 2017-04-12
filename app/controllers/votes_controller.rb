class VotesController < ApplicationController

  # def create
  #   @vote = Vote.new
  #   @vote.work = params[:work_id]
  #   @vote.user = params[:user_id]
  #   @vote.save
  #   if @vote.save
  #     redirect_to root_path
  #   end
  # end

  private
  def vote_params
      return params.require(:vote).permit(:id, :work_id, :user_id)
  end

end
