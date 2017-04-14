class VotesController < ApplicationController

  def create
    already_voted = Vote.where(user_id: session[:user_id]).where(work_id: params[:id])

    if !session[:user_id]
      flash[:error] = "You must log in to upvote"
      redirect_to :back
    elsif already_voted == []
      work = Work.find(params[:id])
      vote = Vote.create
      vote.work_id = work.id
      vote.user_id = session[:user_id]
      vote.save
      redirect_to :back
    else
      flash[:error] = "Already voted on this"
      redirect_to :back
    end
  end


  private
  def vote_params
    params.require(:vote).permit(:id, :user)
  end


end
