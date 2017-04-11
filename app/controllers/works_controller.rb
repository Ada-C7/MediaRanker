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
    else
      render "new"
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def update
    @work = Work.find(params[:id])

    @work.title = work_params[:title]
    @work.category = work_params[:category]
    @work.creator = work_params[:creator]
    @work.pub_yr = work_params[:pub_yr]
    @work.desc = work_params[:desc]

    if @work.save
      redirect_to work_path
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :category, :creator, :pub_yr, :desc)
  end

end
