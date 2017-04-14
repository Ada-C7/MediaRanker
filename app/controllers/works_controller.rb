class WorksController < ApplicationController
  def index
    @works = Work.all

    offset = rand(Work.count)
    @rand_record = Work.offset(offset).first
  end

  def show
    @work = Work.find(params[:id])
  end

end
