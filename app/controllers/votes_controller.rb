class VotesController < ApplicationController
  def upvote
    vote = Vote.new

    vote[:work_id] = params[:id]
    vote[:user_id] = session[:user_id]

    if vote.save
      flash[:success] = "Thanks for voting!"
      redirect_to root_path
    else
      flash[:error] = "Your vote hasn't been counted!"
      redirect_to root_path
    end
  end
end
