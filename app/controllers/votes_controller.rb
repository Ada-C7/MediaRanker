class VotesController < ApplicationController

  def index
  #  @votes = Vote.where()
  end

  def upvote
    @vote = Vote.new
    @vote.work_id = params[:work][:id]
    @vote.user_id = sessions[:id]
    if @vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to work_path
    else
      flash.now[:error] = "Failed to upvote"
      render work_path
    end
  end

  def show
    @vote = Vote.find_by_id(params[:id])
    if !@vote
      render_404
    end
  end
end
