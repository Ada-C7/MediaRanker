class VotesController < ApplicationController

  def create
    if logged_in? #application controller method!
      if Vote.unique?(session[:user_id], params[:id])
        vote = Vote.new
        vote.work_id = params[:id]
        vote.user_id = session[:user_id]
        vote.save
        flash[:success] = "You have successfully upvoted."
        if request.referrer
          redirect_to request.referrer
        else
          redirect_to root_path
        end
      else
        flash[:warning] = "You can only vote once for each work."
        if request.referrer
          redirect_to request.referrer
        else
          redirect_to root_path
        end
      end
    else
      flash[:warning] = "You must be logged in to Vote"
      if request.referrer
        redirect_to request.referrer
      else
        redirect_to root_path
      end
    end
  end

end
