class VotesController < ApplicationController

  def create
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to vote"
    else
      vote = Vote.new
      vote[:user_id] = session[:user_id]
      vote[:content_id] = params[:content_id]
      vote.save
    end

    redirect_back(fallback_location: root_path)


  end


  private

  def vote_params
    params.require(:vote).permit(:user_id, :content_id)
  end

end
