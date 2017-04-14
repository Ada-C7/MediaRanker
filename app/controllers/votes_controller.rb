class VotesController < ApplicationController

  def index
  #  @votes = Vote.where()
  end

  def upvote
    @vote = Vote.create(work_id: params[:id], user_id: session[:id])
    raise
    if @vote.id
      flash[:success] = "Successfully upvoted!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:error] = "Failed to upvote"
      render 'show'
    end
  end

  def show
    @vote = Vote.find_by_id(params[:id])
    if !@vote
      render_404
    end
  end
end
