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

  def update
    @work = Work.find(params[:id])
    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    category = work.category
    work.destroy
    
    redirect_to works_path(category.pluralize)
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end
end
