class VotesController < ApplicationController

  def create
    if session[:user_id]
      @vote = Vote.new
      @vote.user_id = session[:user_id]
      @vote.work_id = params[:work_id]
      if @vote.save
        flash[:success] = "Your vote was recorded for #{@vote.work.title}"
        redirect_to :root
      else
        flash.now[:failure] = "Sorry, something went wrong and your vote was not counted."
      end
    else
      flash.now[:failure] = "You must be logged in to do that."
    end
  end


  private



end
