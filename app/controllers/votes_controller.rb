class VotesController < ApplicationController
  def upvote
    if session[:user_id]
      work = Work.find_by_id(params[:id])
      vote = Vote.new(
        work_id: work.id,
        user_id: session[:user_id]
      )

      vote.save
      flash[:success] = "Successfully upvoted!"
    else
      flash[:error] = "You must be logged in to vote."
    end

    redirect_to :back
  end
end
