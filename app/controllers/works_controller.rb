class WorksController < ApplicationController
  def index
    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")
    @albums = Work.where(category: "album")
  end

  def albums
    @works = Work.where(category: "album")
    @category = "Albums"
    render "category"
  end

  def books
    @works = Work.where(category: "book")
    @category = "Books"
    render "category"
  end

  def movies
    @works = Work.where(category: "movie")
    @category = "Movies"
    render "category"
  end

  def show
    @work = Work.find_by(id: params[:id]) #returns nil
    if @work.nil?
      head :not_found
    end
  end


  #PRIVATE
  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end




end # END of class WorksController
