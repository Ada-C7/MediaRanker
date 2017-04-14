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

  def show
    @work = Work.find(params[:id])
  end
end
