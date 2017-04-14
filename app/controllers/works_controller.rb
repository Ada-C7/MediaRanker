class WorksController < ApplicationController
  def index
    @works = Work.by_category(params[:category].singularize)
  end

  def show
    @work = Work.find(params[:id])
  end

# private
#   def work_params
#     return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
#   end
end
