class WorksController < ApplicationController
  helper WorksHelper

  def index
    @works = Work.all
  end


  def show
    @selected_work = Work.find params[:id]
  end

  def create
    @work = Work.create work_params

    unless @work.id ==  nil
      redirect_to workers_path
    else
      render "new"
    end
  end

  def edit
    @work = Work.find params[:id]
  end

  def update
    @work = Work.find params[:id]

    if @work.save
      redirect_to workers_path
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy params[:id]
    redirect_to workers_path
  end


  private
  def work_params
    params.require(:work).permit(:title, :creator, :category, :year, :description)
  end

end
