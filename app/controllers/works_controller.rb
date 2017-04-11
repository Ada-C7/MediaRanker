class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def update
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to works_path
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      redirect_to works_path
    else
      render "new"
    end

  end
end
