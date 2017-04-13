class VotesController < ApplicationController
  def upvote
    @vote = Vote.new
    @vote.work_id = params[:id]
    @vote.user_id = session[:user]
    @vote.save

    if @vote.save
      flash[:sucess] = "Hoorrayyyy! Your upvote worked."
      redirect_to root_path
    else
      flash[:fail] = "Your vote FAILED"
    end
  end
end
