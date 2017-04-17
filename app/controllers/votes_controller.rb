class VotesController < ApplicationController

  def create
  
    if !session[:user_id]
      flash[:error] = "You must log in to do that"
    elsif
      @vote = Vote.new
      @vote.work_id = params[:id]
      @vote.user_id = session[:user_id]
      flash[:success] = "Work id: #{@vote.work_id} and User ID: #{@vote.user_id} for vote"
      if @vote.save
        flash[:success] = "Successfully Voted"
      else
        flash[:error] = "Could not upvote"
        @vote.errors.each do |field, message|
          flash[:error] = "user #{message}"
        end
      end
    end

    redirect_to :back

  end

end
