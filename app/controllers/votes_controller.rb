class VotesController < ApplicationController

  def create
    if !session[:user_id]
      flash[:error] = "Not logged in"
      redirect_back(fallback_location: :root)
    else
      @vote = Vote.new
      @vote.user_id = session[:user_id]
      @vote.work_id = params[:id]
      if !@vote.save
        flash[:error] = "Could not upvote. User has already voted for this work."
        redirect_to :root
      else
        flash[:success] = "Successfully upvoted!"
        redirect_to :root
      end
    end


  end


  private
  #
  # def duplicate_vote?(id_of_work)
  #   Vote.find(:all, :conditions => ["user_id = ? and work_id = ?", session[:user_id], id_of_work]).any?
  # end

end
