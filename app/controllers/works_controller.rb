class WorksController < ApplicationController

  def index
    @books = books[0..9]
    @albums = albums[0..9]
    @movies = movies[0..9]
  end

 def books
   works = Work.where(category: "book")
   @works = works.sort {|b1, b2| b2.votes.count <=> b1.votes.count}
   return @works
 end

 def albums
   works = Work.where(category: "album")
   @works = works.sort {|a1, a2| a2.votes.count <=> a1.votes.count}
   return @works
 end

def movies
   works = Work.where(category: "movie")
   @works = works.sort {|m1, m2| m2.votes.count <=> m1.votes.count}
   return @works
end


  def show
  @work = Work.find(params[:id])
  end

  def new
  @work = Work.new
  end

  def edit
  @work = Work.find(params[:id])
  end

  def update
  work = Work.find(params[:id])
    if work.update(work_params)
      redirect_to works_path
    end
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.create work_params

    unless work.id == nil
    redirect_to works_path
    end
  end

  def upvote
    if !session[:user_id]

      flash[:error] = "Must be loggen in to vote"
      redirect_to :back
    elsif Vote.where(user_id: session[:user_id]).where(work_id: params[:id]) == []

    work = Work.find(params[:id])
    vote = Vote.create
    vote.work_id = work.id
    vote.user_id = session[:user_id]
    vote.save
    redirect_to :back
    else
    flash[:error] = "Already voted on this"
    redirect_to :back
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private
  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description)
  end


  private
  def work_params
  params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def vote_params
  params.require(:vote).permit(:id)
  end


end
