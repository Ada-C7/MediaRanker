class VotesController < ApplicationController

  def create
    user_name
    @vote = Vote.new
    @vote.work_id = params[:vote[:work_id]]
    @vote.user_id = params[:vote[:user_id]]
    #session conditional to focre login to vote
     flash[:sucess] = Successfully upvoted!
  end

end
