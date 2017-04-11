class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.save
    # if @work.save
    #   redirect_to welcome_path
    # else
    #   render :new
    # end
  end

  def show
     @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save
      # redirect_to work_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
  end

end
