class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find_by_id(params[:id])
  end

  def show_category
    works = Work.all
    @category_works = []
    works.each do |work|
      if work[:category] == params[:category].singularize
        @category_works << work
      end
    end
    return @category_works
  end

  def edit
    @work = Work.find_by_id(params[:id])
  end

  def new
    @work = Work.new(category: params[:category])
  end

  def create
    @work = Work.create work_params
    @work.category = params[:category].singularize

    if @work.save
      flash[:success] = "#{work.category} added successfully"
      redirect_to category_path(params[:category])
    else
      flash.now[:error] = "Error has occurred"
      render 'new'
    end
  end

  def update
    @work = Work.find_by_id(params[:id])

    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.publication_year = work_params[:publication_year]
    @work.description = work_params[:description]

    if @work.save
      flash[:success] = "#{@work.category} edited successfully"
      redirect_to category_path(category: @work.category.pluralize)
    else
      flash.now[:error] = "Error has occurred"
      render "edit"
    end
  end

  def destroy
    work = Work.find_by_id(params[:id])
    category = work.category
    work.destroy

    redirect_to category_path(category.pluralize)
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
