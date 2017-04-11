class WorksController < ApplicationController
  def index
    @works = Work.all
    @albums = category_index("album")
    @books = category_index("book")
    @movies = category_index("movie")
  end

  def show
    @selected_work = Work.find_by id: params[:id]
    if !@selected_work
      render_404
    end
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
    #update should not change category
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.description = work_params[:description]
    @work.publication_year = work_params[:publication_year]

    if @work.save
      redirect_to work_path #this needs to redirect to category path
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path #this needs to be edited in the future to category path
  end
end


private

def work_params
  params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
end
