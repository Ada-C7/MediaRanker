class VotesController < ApplicationController

  def create
    @vote = Vote.new
    @vote.user = params[:user_id]
    @vote.work = params[:work_id]
    if @vote.save
      redirect_to :root
    end
  end


  private



end
