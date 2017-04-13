class VotesController < ApplicationController

  def create
    if logged_in? #application controller method!
      if Vote.unique?(session[:user_id], params[:id])
        vote = Vote.new
        vote.work_id = params[:id]
        vote.user_id = session[:user_id]
        vote.save
        redirect_to work_path
      else
        flash[:warning] = "You can only vote once for each work."
        redirect_to work_path
      end
    else
      flash[:warning] = "You must be logged in to Vote"
      redirect_to login_path
    end
  end

end
