class WorksController < ApplicationController
  def index_album
    @albums = Work.where(category: "album")
  end

  def index_movie
    @movies = Work.where(category: "movie")
  end

  def index_book
    @book = Work.where(category: "book")
  end

  def show
    @result_work = Work.find_by_id(params[:id])
    if !@result_work
      render_404
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.publish_year = work_params[:publish_year]

    if @work.update(work_params)
      redirect_to work_path(@work.id)
    end

  end

  def new
    
  end

private

def work_params
  params.require(:work).permit(:category, :title, :creator, :publish_year, :description)
end


end
