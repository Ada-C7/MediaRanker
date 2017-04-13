class VotesController < ApplicationController

  def create
    vote = Vote.new
    vote.work_id = params[:id]
    if session[:user_id]
      vote.user_id = session[:user_id]
    else
      flash[:error] = "You must log in to do that"
      redirect_to :back
    end

    if Vote.where({user_id: session[:user_id], work_id: params[:id]})
      flash[:error] = "Could not upvote"
      redirect_to :back
    end

    if work.save
      flash[:success] = "Successfully Voted"
      redirect_to :back
    end
  end

end
