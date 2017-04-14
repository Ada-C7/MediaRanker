class WorksController < ApplicationController
  def index
    @works = Work.by_category(params[:category].singularize)
    # @movies = Work.where(category: "movie")
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @category = params[:category]
    @work = Work.new(category: @category.singularize)
  end

  def create
    @work = Work.create(work_params)
    if @work.save
      redirect_to category_path(@work.category.pluralize)
    else
      render :new
    end
  end

private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
