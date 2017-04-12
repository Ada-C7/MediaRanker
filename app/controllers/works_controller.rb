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
    category = params[:work][:category].to_s.pluralize

    if @work.save
      redirect_to works_path(category)
    else
      render :new
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end
end
