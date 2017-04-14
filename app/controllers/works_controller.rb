class WorksController < ApplicationController

  def index
    @works = Work.by_category(params[:category])
  end

  def show
    @work = Work.find(params[:id])
    if @work.nil?
      head :not_found
    end 
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update(work_params)

    redirect_to work_path(work)
  end

  def destroy
    Work.find(params[:id]).destroy
    redirect_to work_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
