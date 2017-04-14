class VotesController < ApplicationController

  def upvote
    @vote = Vote.create(work_id: params[:id], user_id: session[:id])
    if @vote
      # raise
      flash[:success] = "Successfully upvoted!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:error] = "Failed to upvote"
      render 'show'
    end
  end

end
