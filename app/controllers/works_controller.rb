class WorksController < ApplicationController
  def index
    @category = params[:works]
    @works = Work.where(category: @category.singularize )
  end

  def new
    @category = params[:works]
    @work = Work.new
  end
end
