class VotesController < ApplicationController
  def upvote
    vote = Vote.new
    vote[:work_id] = params[:id]
    vote[:user_id] = session[:user_id]
    vote.save

    redirect_to root_path
  end
end
