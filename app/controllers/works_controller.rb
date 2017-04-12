class WorksController < ApplicationController
  def index
    @movies = Work.movies
    @albums = Work.albums
    @books = Work.books
  end

  def show
    @work = Work.find_by_id(params[:id])
    render_404 if !@work
  end

  def new
    @work = Work.new
    render_404 if ["movies", "books", "albums"].exclude?(params[:category])
  end


end
