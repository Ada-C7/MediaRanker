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
      flash[:failure] = "Your vote failed! YOU'RE a failure!!"
      redirect_to :back
    end
  end
end
