class WorksController < ApplicationController
  def index
    @spotlight_work = Work.all.sample
    @categories = Work.all.map {|work| work.category}.uniq
  end

  def new
  end

  def create
  end

  def show
  end

  def show_category
    @category = params[:category]
    @works = Work.where(category: @category)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :description, :creator, :publication_year)
  end

end
