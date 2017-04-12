class VotesController < ApplicationController
  def index
    @votes = User.all
  end

  def new
    @vote = User.new(params[:id])
  end

  def create
    @vote = User.create
  end
end
