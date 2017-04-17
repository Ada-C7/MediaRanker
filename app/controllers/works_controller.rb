class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
    @work = Work.find_by_id(params[:id])
    #Book.find_by_id or whatever param you want and return nil if it doesn't find it - possibly the desired result
    if !@work
      render_404
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params
    puts @work.errors.messages
    if @work.id != nil
      flash[:success] = "Go you! You have successfully added a new work."
      redirect_to works_path
    else
      flash.now[:error] = "Ooooo, Error 11! The olde snack saddle is upon you."
      render "new"
    end
  end

  # def books
  #   @books = Work.where(category: 'book').order('votes_count DESC')
  # end
  #
  # def albums
  #   @albums = Work.where(category: 'album').order('votes_count DESC')
  # end
  #
  # def movies
  #   @movies = Work.where(category: 'movies').order('votes_count DESC')
  # end


  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :year, :desription)
  end

end
