class VotesController < ApplicationController
  def create
    if session[:user_id].nil?
      return redirect_to login_path
    end
    vote_check = Vote.where({:user_id => session[:user_id], :work_id => params[:work_id]}) #array of result

    if vote_check.empty?

      vote = Vote.new
      vote.work_id = params[:work_id] #coming from movie index line 7
      vote.user_id = session[:user_id]
      vote.save!
    end

    category = Work.find(params[:work_id]).category

    if category == "movie"
      redirect_to movies_path
    elsif category == "album"
      redirect_to albums_path
    elsif category == "book"
      redirect_to books_path
    end
  end
end
