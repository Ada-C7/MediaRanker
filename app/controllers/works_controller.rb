class WorksController < ApplicationController
  def index
    @works = Work.all
    @albums = Work.show_category("album")
    @books = Work.show_category("book")
    @movies = Work.show_category("movie")
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work =Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to work_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy_all
    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :created_by, :published, :description)
  end
end
