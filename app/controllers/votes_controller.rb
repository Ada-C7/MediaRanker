class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end


  def upvote
    work_id = params[:work_id]

    user_id =  session[:user_id]

    @vote = Vote.create(work_id: work_id, user_id: user_id)

    if @vote.id != nil
      voted_media = Work.find(work_id)

      if voted_media.category == "album"
        redirect_to albums_path
      elsif voted_media.category == "book"
        redirect_to books_path
      elsif voted_media.category == "movie"
        redirect_to movies_path
      else
        redirect_to root_path
      end
    end
  end

  def created_at
    @vote.created_at.to_date
  end

end
