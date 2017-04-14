class WorksController < ApplicationController
  def index
    @works = Work.all

    offset = rand(Work.count)
    @rand_record = Work.offset(offset).first
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

private
  def book_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description)
  end

end
