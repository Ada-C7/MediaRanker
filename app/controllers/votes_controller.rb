class VotesController < ApplicationController

  def upvote
    if Vote.already_voted(params[:id], session[:user_id])
      flash[:error] = "You've already voted for this. Stop trying to vote for this."
      redirect_to root_path
    else
      vote = Vote.new
      vote[:work_id] = params[:id]
      vote[:user_id] = session[:user_id]

      if vote.save
        flash[:success] = "You voted. You're a voter."
        redirect_to root_path
      else
        flash[:error] = "Can't count that shit."
        redirect_to login_path
      end
    end


  end
end
