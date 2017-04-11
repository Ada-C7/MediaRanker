class WorksController < ApplicationController
  def index
    @works = Work.all
    @spotlight_work = Work.spotlight
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def create
    @work = Work.new(work_params)
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    if @work.update(work_params)

      category = params[:category]
      if category == "movie"
        redirect_to movies_path
      elsif category == "book"
        redirect_to books_path
      else # category == "album"
        redirect_to albums_path
      end

    else
      render "edit"
    end
  end

  def destroy
    Trip.destroy(params[:id])

    category = params[:category]
    if category == "movie"
      redirect_to movies_path
    elsif category == "book"
      redirect_to books_path
    else # category == "album"
      redirect_to albums_path
    end

  end


  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
  end
end
