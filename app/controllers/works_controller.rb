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

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save
    redirect_to works_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to works_path
  end

private
  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description)
  end

end
