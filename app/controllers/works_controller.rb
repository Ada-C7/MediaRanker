class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @selected_work = Work.find params[:id]
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create! work_params
    unless @work.id == nil
      redirect_to work_path(@work.id)
    else
      render "new"
    end
  end

  def edit
    @work = Work.find params[:id]
  end

  def update
    @work = Work.find params[:id]

    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.description = work_params[:description]
    @work.publication_year = work_params[:publication_year]

    if @work.save
      redirect_to work_path
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path #this needs to be edited in the future to movies path 
  end
end


private

def work_params
  params.require(:work).permit(:title, :creator, :description, :publication_year)
end
