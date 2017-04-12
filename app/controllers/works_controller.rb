class WorksController < ApplicationController
  def index
    @works = Work.all
    @books = Work.where(mediatype: 'book')
    @movies = Work.where(mediatype: 'movie')
    @albums = Work.where(mediatype: 'album')
  end

  def mediatype_list
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      redirect to root_path
    else
      render "new"
    end
  end

  def new
    @work = Work.new
  end

  def edit
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:id, :mediatype, :title, :creator, :year, :description)
  end

end
