class WorksController < ApplicationController

  def index

    @books = Work.where(category: "book").limit(10)
   @albums = Work.where(category: "album").limit(10)
   @movies = Work.where(category: "movie").limit(10)

    # @works = Work.all.sort {|d1, d2| d1.id <=> d2.id}
  end

 def books
   @books = Work.where(category: "book")

 end

 def albums
   @albums = Work.where(category: "album")
 end

def movies
   @movies = Work.where(category: "movie")
end


  def show
  @work = Work.find(params[:id])
  end

  def new
  @work = Work.new
  end

  def edit
  @work = Work.find(params[:id])
  end

  def update
  work = Work.find(params[:id])
    if work.update(work_params)
      redirect_to works_path
    end
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.create work_params

    unless work.id == nil
    redirect_to works_path
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private
  def passenger_params
  params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end


end
