class WorksController < ApplicationController
  def index
    @works = Work.by_category
  end
  def show
    @work = Work.find(params[:id])
  end
  def works_by_category
    @works_by_category = Work.by_category(params[:category])
  end
end
