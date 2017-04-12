class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def works_index
    @works = Work.where(category: (params[:category]).singularize)
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
    @work.category = params[:category]
  end

  def create
    @work = Work.create(work_params)
    @work.category = params[:category].singularize

    if @work.save
      redirect_to works_path(@work.category)
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update_attributes(work_params)

    if @work.save
      redirect_to works_path(@work.category.pluralize)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    @destroyed_category = work.category
    work.destroy

    redirect_to works_path(@destroyed_category)
  end

  private

  def work_params
    return params.require(:work).permit(:title, :created_by, :publication_year, :category, :description)
  end

end
