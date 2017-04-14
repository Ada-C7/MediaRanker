class WorksController < ApplicationController

  def home
    #TODO sort top 10 later
      @movies = Work.movies
      @books = Work.books
      @albums = Work.albums
  end

  def index
    @media_type = params[:media_type]
    case @media_type
    when 'movies'
      @works = Work.movies
    when 'books'
      @works = Work.books
    when 'albums'
      @works = Work.albums
    end
  end

  def new
    @work = Work.new
    @media_type = params[:media_type]
  end

  def create
    @work = Work.new(work_params)
    # find a way to set media types without the user
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to work_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to root_path
  end

  private
    def work_params
      return params.require(:book).permit(:title, :by, :year, :description)
    end
end
