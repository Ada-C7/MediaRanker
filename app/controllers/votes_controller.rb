class VotesController < ApplicationController

  def Upvote
    if !session[:user_id]
      flash[:error] = "You must log in to do that"
      redirect_to :back
    else
      @vote = Vote.new
      @vote.user_id = session[:user_id]
      @vote.work_id = params[:id]
      if !@vote.save
        flash[:error] = "You already voted for this work."
        redirect_to :root
      else
        flash[:success] = "Successfully voted!"
        redirect_to :root
      end
    end
  end


  private
  def vote_params
    params.require(:vote).permit(:id, :user)
  end


end
