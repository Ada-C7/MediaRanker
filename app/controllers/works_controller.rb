class WorksController < ApplicationController
  def index
    @books = index_book
    @movies = index_movie
    @albums = index_album
    # @works = Work.all
    # @albums = Work.where(category: "album")
    # @movies = Work.where(category: "movie")
    # @books = Work.where(category: "book")
  end

  def index_album
    @albums = Work.where(category: "album") #.order by method.limit
  end
  # unique constraints

  def index_movie
    @movies = Work.where(category: "movie")

  end
  #
  def index_book
    @books = Work.where(category: "book")
  end

  def show
    @result_work = Work.find_by_id(params[:id])
    if !@result_work
      render_404
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def update
    @work = Work.find(params[:id])
    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.publish_year = work_params[:publish_year]

    if @work.update(work_params)
      redirect_to work_path(@work.id)
    end

  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      redirect_to works_path
    end

  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publish_year, :description)
  end


end
