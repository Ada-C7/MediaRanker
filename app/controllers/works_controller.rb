class WorksController < ApplicationController

  @work = Work.where(category: 'work')

  def books
    @books = Work.where(category: 'book').order('votes_count DESC')
  end
  @albums = Work.where(category: 'album')
  @movies = Work.where(category: 'movies')

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
    @book = Work.new
  end

  def create
    @book = Work.create work_params
    puts @work.errors.messages
    if @work.id != nil
      flash[:success] = "Go you! You have successfully added a new work."
      redirect_to books_path
    else
      flash.now[:error] = "Ooooo, Error 11! The olllde snack saddle is upon you."
      render "new"
    end
  end

  def work_params
    params.require(:work).permit(:category, :title, :creator, :year, :desription)
  end
end
