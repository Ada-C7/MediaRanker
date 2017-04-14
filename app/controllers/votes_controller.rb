class VotesController < ApplicationController

  def upvote

    @vote = Vote.create(work_id: params[:id], user_id: session[:id])
    if @vote
      # raise
      flash[:success] = "Successfully upvoted!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:error] = "Failed to upvote"
      # not working - if vote not created, displays success message anyway
      # render 'show'
    end
  end
end
