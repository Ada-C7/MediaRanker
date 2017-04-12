class WorksController < ApplicationController
  def index
    @works = Work.all
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
    @work = Work.new
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      redirect_to works_path
    else
      render "new"
    end
  end

  def update
    @work = Work.find_by_id(params[:id])

    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.publication_year = work_params[:publication_year]
    @work.description = work_params[:description]

    if @work.save
      redirect_to category_path(params[:category])
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :author_id, :publication_year, :description)
  end
end
