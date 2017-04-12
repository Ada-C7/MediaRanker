class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.year = work_params[:year]
    @work.description = work_params[:description]

    if @work.save
      redirect_to work_path(@work.id)
    else
      render "edit"
    end

  end

  def books
    @books = Work.where(category: 'book')
  end

  def movies
    @movies = Work.where(category: 'movie')
  end

  def albums
    @albums = Work.where(category: 'album')
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to root_path
  end

  private

  def work_params
    params.require(:work).permit(:id, :category, :title, :creator, :year, :description)
  end

end
