class WorksController < ApplicationController
  def index
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")

    @spotlight = Work.all.sample
  end

  def show
    @work = Work.find_by_id(params[:id])

    if !@work
      render_404
    end
  end


  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      # redirect_back(fallback_location: root_path)
      redirect_to root_path
    else
      flash.now[:failure] = "A problem occurred: Could not create #{@work.category}"
      # this now also has a routing problem
      # render "new"
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :pub_year, :description)
  end
end
