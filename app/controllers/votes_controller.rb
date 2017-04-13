class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    user = User.find(params[:user_id])
    work = Work.find(params[:work_id])
    vote_data = {
      user_id: user,
      work_id: work
    }
    @vote = Vote.new(vote_data)
    if @vote.save
      redirect_to user_path(@vote.user_id)
      render :new
    end
  end

  def show_by_work
    @vote = Work.find(params[:id]).votes
  end
end
