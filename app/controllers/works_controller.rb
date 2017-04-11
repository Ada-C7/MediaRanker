class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    if @work.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update(work_params)
    if @work.save
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    Work.destry(params[:id])
    redirect_to :root
  end

  private

  def work_params
    params.require(:work).permit(:name, :created_by, :pub_year, :desc)
  end

end
