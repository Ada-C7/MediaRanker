class WorksController < ApplicationController
  helper WorksHelper

  def index
    @works = Work.all
  end


  def show_category
    @category = params[:category]
    @category_works = []
    Work.all.each do |work|
      @category_works << work if work[:category] == params[:category].singularize
    end
    return @category_works
  end

  def show
    @selected_work = Work.find params[:id]
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params

    unless @work.id ==  nil
      redirect_to works_path
    else
      render "new"
    end
  end

  def edit
    @work = Work.find params[:id]
  end

  def update
    @work = Work.find params[:id]
    @work.update! work_params

    if @work.save
      redirect_to works_path
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy params[:id]
    redirect_to works_path
  end


  private
  def work_params
    params.require(:work).permit(:title, :creator, :category, :year, :description)
  end

end
