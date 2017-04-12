class WorksController < ApplicationController
  def index
    @category = params[:works]
    @works = Work.where(category: @category.singularize )
  end
end
