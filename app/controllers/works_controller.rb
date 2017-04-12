class WorksController < ApplicationController
  def index
    @media_type = params[:media_type]
  end

  def new
    @work = Work.new
  end
end
