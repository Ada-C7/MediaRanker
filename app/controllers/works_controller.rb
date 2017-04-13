class WorksController < ApplicationController
  def index
    @works = Work.by_category(params[:category].singularize)
  end
  def show
    @work = Work.find(params[:id])
  end
end
