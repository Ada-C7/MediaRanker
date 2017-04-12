class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def album_index
    @works = Work.all
    @works.where(category: "album")
  end

  def book_index
    @works = Work.all
    @works.where(category: "book")
  end

  def movie_index
    @works = Work.all
    @works.where(category: "movie")
  end

  def new
    @work = Work.new(params[:id])
  end

  def create
    @work = Work.create(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to works_path
  end

  def delete
    @work = Work.find(params[:id])
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :category, :creator, :description, :pub_date)
  end
end
