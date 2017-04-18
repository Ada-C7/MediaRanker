class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @vote.save
  end

  def destroy
    Vote.destroy(params[:id])
  end


end
