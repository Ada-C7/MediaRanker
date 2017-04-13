class VotesController < ApplicationController
  def index
    @votes = User.all
  end

  def new
    @vote = User.new(params[:id])
  end

  def show_by_work
    @vote = Work.find(params[:id]).votes
  end
end
