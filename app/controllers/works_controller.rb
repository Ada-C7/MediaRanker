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

  def show_category
    @works = Work.where(category: params[:category].singularize)
    render_404 if ["movies", "books", "albums"].exclude?(params[:category])
  end

  def new
    @work = Work.new
    @category = params[:category].singularize

    render_404 if ["movies", "books", "albums"].exclude?(params[:category])
  end

  def create
    @work = Work.create work_params
    @category = params[:work][:category].singularize

    unless @work.id == nil
      redirect_to works_path
    else
      render "new"
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :year_published, :description, :category)
  end
end
