class VotesController < ApplicationController
  def create
    vote = Vote.new
    vote.work_id = params[:work_id] #coming from movie index line 7
    vote.user_id = session[:user_id]
    vote.save!

    if vote.work.category == "movie"
      redirect_to movies_path
    elsif vote.work.category == "album"
      redirect_to albums_path
    elsif vote.work.category == "book"
      redirect_to books_path
    end
  end
end
