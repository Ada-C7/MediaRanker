class WorksController < ApplicationController
  def index
    @category = params[:works]
    @works = Work.where(category: @category.singularize )
  end

  def new
    @category = params[:works]
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.category = params[:works].singularize

    if @work.save
      redirect_to works_path(@work.category.pluralize)
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end



  private

  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end
end
