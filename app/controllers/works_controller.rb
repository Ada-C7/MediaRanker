class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show_movies
    @movies = Work.where(category: "movie")
  end

  def show_books
    @books = Work.where(category: "book")
  end

  def show_albums
    @albums = Work.where(category: "album")
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to root_path
    else
      render :new, status: :bad_request
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
    @work.update_attributes(work_params)

    if @work.save
      redirect_to work_path(@work.id)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description)
  end

end
