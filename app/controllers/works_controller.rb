class WorksController < ApplicationController
  def index
    @works = Work.all
    @books = Work.where(category: 'book')
    @movies = Work.where(category: 'movie')
    @albums = Work.where(category: 'album')
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
    params.require(:work).permit(:id, :category, :title, :creator, :year, :description)
  end

end
