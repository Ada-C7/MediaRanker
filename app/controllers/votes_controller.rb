class VotesController < ApplicationController

  def create
    if logged_in? #application controller method!
      if Vote.unique?(session[:user_id], params[:id])
        vote = Vote.new
        vote.work_id = params[:id]
        vote.user_id = session[:user_id]
        vote.save
        flash[:success] = "You have successfully upvoted."
        referrer_or_root
      else
        flash[:warning] = "You can only vote once for each work."
        referrer_or_root
      end
    else
      flash[:warning] = "You must be logged in to Vote"
      referrer_or_root
    end
  end

end
