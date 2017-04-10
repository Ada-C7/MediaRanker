class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @vote.user_id = params[:user][:id]
    @vote.work_id = params[:work][:id]
    if @vote.save
      redirect_to :root
    else
      render :new
    end

  end

  def show
    @vote = Vote.find(params[:id])
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(vote_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @vote = Vote.find(params[:id]).destroy
  end

  private

  def vote_params
    params.require(:votes).permit(:title, :type, :description, :published)
  end

end
