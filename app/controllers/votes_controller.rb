class VotesController < ApplicationController
  def upvote
    work = Work.find_by_id(params[:id])
    user = User.find_by_id(session[:user_id])

    if !session[:user_id]
      flash[:error] = "You must be logged in to vote."
    elsif user.votes.map { |vote| vote.work_id }.include? work.id
      flash[:error] = "You already voted for #{work.title}."
    else
      vote = Vote.new(
        work_id: work.id,
        user_id: user.id
      )

      vote.save
      flash[:success] = "Successfully upvoted!"
    end

    redirect_to :back
  end
end
