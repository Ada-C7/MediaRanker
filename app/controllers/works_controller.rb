class WorksController < ApplicationController
  def index
    @work_category = params[:work_category]
    category = @work_category.chomp!('s')
    @works = Work.where(category: category)
  end
end
