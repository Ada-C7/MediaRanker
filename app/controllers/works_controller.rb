class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    @work.work_id = work_params[:work_id]
    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.pub_year = work_params[:pub_year]
    @work.description = work_params[:description]

    if @work.save
      redirect_to work_path(@work.id)
    else
      render "edit"
    end
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

  def new
    @work = Work.new
  end

  private

  def work_params
    params.require(:work).permit(:work_id, :category, :title, :creator, :pub_year, :description)
  end

end
