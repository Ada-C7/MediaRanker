class WorksController < ApplicationController

  def index
    @books = index_books
    @albums = index_albums
    @movies = index_movies
    @top_work = Work.top_work
  end

  def index_books
    books = Work.where(category: "book")
    sorted_books = books.sort_by { |book| book.votes.count }
    @works = sorted_books.reverse
  end

  def index_albums
    albums = Work.where(category: "album")
    sorted_albums = albums.sort_by {|album| album.votes.count }
    @works = sorted_albums.reverse
  end

  def index_movies
    movies = Work.where(category: "movie")
    sorted_movies = movies.sort_by {|movie| movie.votes.count }
    @works = sorted_movies.reverse
  end

  def show
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new

    @work.title = work_params[:title]
    @work.category = params[:category]
    @work.creator = work_params[:creator]
    @work.pub_yr = work_params[:pub_yr]
    @work.desc = work_params[:desc]

    if @work.save
      flash[:success] = "You have created a #{@work.category} #{@work.title}."
      redirect_to works_path
    else
      render "new"
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

    @work.title = work_params[:title]
    @work.category = params[:category]
    @work.creator = work_params[:creator]
    @work.pub_yr = work_params[:pub_yr]
    @work.desc = work_params[:desc]

    if @work.save
      flash[:success] = "You have updated #{@work.name}."
      redirect_to work_path
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :pub_yr, :desc)
  end

end
