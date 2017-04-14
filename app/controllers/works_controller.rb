class WorksController < ApplicationController
  def index
    @works = Work.by_category(params[:category].singularize)
  end
  def show
    @work = Work.find(params[:id])
  end
  # def category
  #   @category = params[:category]
  #
  # end

  def new
    @category = params[:category]
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.category = params[:category].singularize
    @work.valid?
    puts ">>>>>>>>>>>> #{@work.errors.messages}"

    if @work.save
      redirect_to category_path(@work.category.pluralize)
    else
      render :new
    end
  end


  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end
end
