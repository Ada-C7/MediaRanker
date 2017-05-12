class VotesController < ApplicationController
  def upvote
    @vote = Vote.new
    @vote.work_id = params[:id]
    @vote.user_id = session[:user]
    @vote.save

    if @vote.save
      flash[:success] = "Hoorrayyyy! Your upvote worked."
      redirect_to :back
    else
      flash[:failure] = "Your vote failed! YOU'RE a failure!! ....just kidding. Login first silly! "
      redirect_to :back
    end
  end
end
