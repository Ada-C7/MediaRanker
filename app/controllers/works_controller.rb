class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    # @work.category = "movie"
    @work.save
    if @work.save
      redirect_to root_path
    else
      render :new, status: :bad_request #{}"new_#{@work.category}_path"
    end
  end

  def show
    @work = Work.find_by(id: params[:id]) #changed to find_by; if not found -return nil
    if @work.nil?
      head :not_found
    end
  end

  def show_albums
    @all_albums = Work.where(category: "album")
  end
  def show_books
    @all_books = Work.where(category: "book")
  end
  def show_movies
    @all_movies = Work.where(category: "movie")
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    if work.save
      redirect_to work_path(work)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to welcome_index_path
  end

  def upvote
    @work = Work.find(params[:id])
    @work.votes.create  #create new vote for this work
  end

  private
  def work_params
    return params.require(:work).permit( :category, :title, :creator, :publication_year, :description)
  end

end
