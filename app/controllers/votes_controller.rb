class VotesController < ApplicationController

  def create
    if logged_in? #application controller method!
      if Vote.unique?(session[:user_id], params[:id])
        vote = Vote.new
        vote.work_id = params[:id]
        vote.user_id = session[:user_id]
        vote.save
        flash[:success] = "You have successfully upvoted."
        redirect_to request.referrer
      else
        flash[:warning] = "You can only vote once for each work."
        redirect_to request.referrer
      end
    else
      flash[:warning] = "You must be logged in to Vote"
      redirect_to request.referrer
    end
  end

end
