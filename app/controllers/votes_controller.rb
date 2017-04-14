class VotesController < ApplicationController

  def create
    already_voted = Vote.where(user_id: session[:user_id]).where(work_id: params[:id])

    if !session[:user_id]
      flash[:error] = "You must log in to upvote"
      redirect_back(fallback_location: root_path)
    elsif already_voted == []
      work = Work.find(params[:id])
      vote = Vote.create
      vote.work_id = work.id
      vote.user_id = session[:user_id]
      vote.save
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Already voted on this"
      redirect_back(fallback_location: root_path)
    end
  end


  private
  def vote_params
    params.require(:vote).permit(:id, :user)
  end


end
