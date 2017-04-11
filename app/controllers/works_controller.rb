class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find_by_id(params[:id])
    if !@result_work
      render_404
    end
  end


end
