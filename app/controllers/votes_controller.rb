class VotesController < ApplicationController
  def create
    user_name
    if !@user
      flash[:failure] = "You must log in to do that"
    else
      @vote = Vote.new
      @vote.work_id = params[:work_id]
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
      else
        flash[:failure] = "Could not upvote"
        flash[:error] = "user: has already voted for this work"
      end
    end
    redirect_to work_path(params[:work_id])
  end

  def create_from_list
    user_name
    if !@user
      flash[:failure] = "You must log in to do that"
    else
      @vote = Vote.new
      @vote.work_id = params[:work_id]
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
      else
        flash[:failure] = "Could not upvote"
        flash[:error] = "user: has already voted for this work"
      end
    end
    work = Work.find_by_id(params[:work_id])
    if work.category == "movie"
      redirect_to movies_path
    elsif work.category == "book"
      redirect_to books_path
    else
      redirect_to albums_path
    end
  end
end
