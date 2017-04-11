class WorksController < ApplicationController

  def index
    works = Work.all
    @books = works.find_all { |work| work.category == "book" }
    @albums = works.find_all { |work| work.category == "album" }
    @movies = works.find_all { |work| work.category == "movie" }
  end

  def show
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      redirect_to works_path
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :category, :creator, :pub_yr, :desc)
  end

end
